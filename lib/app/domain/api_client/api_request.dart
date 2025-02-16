import 'package:mobile_coding_challenge/app/domain/api_client/http_method.dart';

class ApiRequest {
  final String url;
  final String method;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? headers;
  final dynamic body;

  ApiRequest({
    required this.url,
    required this.method,
    this.query,
    this.headers,
    this.body,
  });

  static ApiRequest get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethod.get,
      headers: headers,
      query: query,
    );
  }

  static ApiRequest post(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic body,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethod.post,
      body: body,
      query: query,
      headers: headers,
    );
  }

  static ApiRequest delete(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethod.delete,
      query: query,
      headers: headers,
    );
  }

  static ApiRequest put(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic body,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethod.put,
      body: body,
      query: query,
      headers: headers,
    );
  }

  static ApiRequest patch(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic body,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethod.patch,
      body: body,
      query: query,
      headers: headers,
    );
  }
}
