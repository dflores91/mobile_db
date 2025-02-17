import 'package:dio/dio.dart';
import 'package:mobile_coding_challenge/app/application/config/injectable.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/api_request.dart';
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart';

class ApiClient {
  ApiClient._privateConstructor();

  static final ApiClient _instance = ApiClient._privateConstructor();
  late Dio _dio;

  factory ApiClient({
    required String baseUrl,
    Map<String, Object>? headers,
    List<Interceptor>? interceptors,
  }) {
    _instance._dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
      ),
    );

    if (interceptors != null) {
      _instance._dio.interceptors.addAll(interceptors);
    }

    return _instance;
  }

  Future<T> request<T, E>(
    ApiRequest request,
    T Function(dynamic) fromJson,
  ) async {
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer ${getIt<FlavorConfig>().token}',
      'accept': 'application/json',
    };

    if (request.headers != null) {
      headers.addAll(request.headers!);
    }
    
    final response = await _instance._dio.request<E>(
      request.url,
      data: request.body,
      queryParameters: request.query,
      options: Options(method: request.method, headers: headers),
    );

    return fromJson(response.data);
  }
}
