import 'package:dio/dio.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/api_request.dart';

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
    final response = await _instance._dio.request<E>(
      request.url,
      data: request.body,
      queryParameters: request.query,
      options: Options(method: request.method, headers: request.headers),
    );

    return fromJson(response.data);
  }
}
