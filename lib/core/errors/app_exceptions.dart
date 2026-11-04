import 'dart:async';

/// Base error type for domain failures.
sealed class AppException implements Exception {
  const AppException(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => message;
}

/// Provider / network failures.
class ProviderException extends AppException {
  const ProviderException(super.message, {super.cause});
}

/// Invalid configuration (missing API key, unknown provider).
class ConfigurationException extends AppException {
  const ConfigurationException(super.message, {super.cause});
}

/// Persistence / database failures.
class StorageException extends AppException {
  const StorageException(super.message, {super.cause});
}

/// Automation engine failures (reply action unavailable, rate limited).
class AutomationException extends AppException {
  const AutomationException(super.message, {super.cause});
}

/// Result wrapper for operations that can fail.
sealed class AppResult<T> {
  const AppResult();
}

class AppSuccess<T> extends AppResult {
  const AppSuccess(this.value);
  final T value;
}

class AppFailure extends AppResult {
  const AppFailure(this.error);
  final AppException error;
}

extension on Future<T> {
  /// Wrap a future so it never throws — use in UI-bound flows.
  Future<AppResult<T>> toAppResult() async {
    try {
      return AppSuccess(await this);
    } on AppException catch (e) {
      return AppFailure(e);
    } catch (e) {
      return AppFailure(ProviderException('Unexpected error', cause: e));
    }
  }
}
