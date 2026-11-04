import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/app_config.dart';
import '../utilities/logger.dart';

/// Dio HTTP client with a strict host allowlist.
///
/// Any request to a host outside [AppConfig.allowedHosts] is refused
/// before data is sent. No logging of request bodies (they may contain
/// user messages).
@immutable
final class AppHttpClient {
  AppHttpClient._(this._dio);

  final Dio _dio;

  factory AppHttpClient() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 2),
        // Never send cookies to third parties.
        validateStatus: (status) => status != null && status < 400,
      ),
    );
    dio.interceptors.add(_HostGuardInterceptor());
    dio.interceptors.add(_SafeLoggingInterceptor());
    return AppHttpClient._(dio);
  }

  Dio get dio => _dio;

  Future<Response> get(String path, {Map<String, dynamic>? query}) =>
      _dio.get(path, queryParameters: query);

  Future<Response> post(String path, {Object? data}) =>
      _dio.post(path, data: data);

  Future<Response> put(String path, {Object? data}) =>
      _dio.put(path, data: data);

  Future<Response> delete(String path) => _dio.delete(path);
}

/// Refuses requests to any host outside the allowlist.
class _HostGuardInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final host = options.uri.host;
    if (!AppConfig.allowedHosts.contains(host)) {
      AppLogger.warn('Blocked request to disallowed host: $host');
      handler.reject(
        DioException(
          requestOptions: options,
          message: 'Host not allowed: $host',
          type: DioExceptionType.unknown,
        ),
        true,
      );
      return;
    }
    handler.next(options);
  }
}

/// Logs only method + host + path — never bodies (may contain messages/keys).
class _SafeLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.logSafe('→ ${options.method} ${options.uri.host}${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.logSafe('← ${response.statusCode} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler handler) {
    AppLogger.logSafe('✗ ${e.type} ${e.requestOptions.path}');
    handler.next(e);
  }
}
