import 'dart:developer' as developer;

/// Lightweight logger.
///
/// ⚠️ Never log credentials, tokens, or message contents. Use [logSafe]
/// which redacts common secret patterns before printing.
abstract final class AppLogger {
  static const _redacted = <String>[
    'sk-',
    'ghp_',
    'gho_',
    'Bearer ',
    'api_key',
    'apiKey',
  ];

  static void info(String message) => developer.log(message, name: 'plinteng');

  static void warn(String message) =>
      developer.log(message, name: 'plinteng', level: developer.DiagnosticLevel.warning);

  static void error(String message, [Object? error]) =>
      developer.log(message, name: 'plinteng', level: developer.DiagnosticLevel.error, error: error);

  /// Redacts obvious secret-looking tokens before logging.
  static void logSafe(String message) {
    final redacted = _redacted.fold(
      message,
      (acc, pattern) => acc.replaceAll(pattern, '***'),
    );
    info(redacted);
  }
}
