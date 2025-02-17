import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_coding_challenge/app/presentation/navigation/navigation_service.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';

part 'api_error_response.freezed.dart';
part 'api_error_response.g.dart';

@freezed
class ApiErrorResponse with _$ApiErrorResponse {
  const factory ApiErrorResponse({
    String? name,
    int? status,
    int? code,
    String? message,
  }) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}

class ErrorHandler {
  final DioException dioException;

  ErrorHandler(this.dioException);

  String handleError() {
    final context = NavigationService.navigatorKey.currentContext;
    if (dioException.type == DioExceptionType.connectionTimeout ||
        dioException.type == DioExceptionType.sendTimeout ||
        dioException.type == DioExceptionType.receiveTimeout) {
      return 'errors.timeout'.tr(context!);
    } else if (dioException.type == DioExceptionType.connectionError) {
      return 'errors.connection_error'.tr(context!);
    } else {
      return '${dioException.message}';
    }
  }
}

Either<T, ApiErrorResponse> handleDioException<T>(DioException e) {
  final response = e.response;
  if (response != null) {
    return Right(ApiErrorResponse.fromJson(response.data));
  }
  return Right(ApiErrorResponse(message: ErrorHandler(e).handleError()));
}
