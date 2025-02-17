import 'package:injectable/injectable.dart';
import 'package:mobile_coding_challenge/app/domain/app_storage/app_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AppStorage)
class AppStorageKeyValue implements AppStorage {
  const AppStorageKeyValue(this._preferences);

  final SharedPreferences _preferences;

  @override
  T? getValue<T>(String key, [T Function(String json)? decode]) {
    try {
      if (decode != null) {
        final json = _preferences.getString(key);
        return json != null ? decode(json) : null;
      }

      final value = _preferences.get(key) as T?;

      return value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> remove(String key) => _preferences.remove(key);

  @override
  Future<bool> clear() => _preferences.clear();

  @override
  Future<bool> setValue(
    String key,
    value, [
    String Function(dynamic data)? encode,
  ]) {
    if (encode != null) {
      return _preferences.setString(key, encode(value));
    }

    if (value is List<String>) {
      return _preferences.setStringList(key, value);
    }

    switch (value.runtimeType) {
      case const (double):
        return _preferences.setDouble(key, value);
      case const (bool):
        return _preferences.setBool(key, value);
      case const (String):
        return _preferences.setString(key, value);
      case const (int):
        return _preferences.setInt(key, value);
      default:
        throw Exception(
          'The setter for ${value.runtimeType} is not implemented',
        );
    }
  }
}
