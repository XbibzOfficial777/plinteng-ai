import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config/app_config.dart';
import '../errors/app_exceptions.dart';
import '../utilities/logger.dart';

/// Secure storage wrapper for credentials.
///
/// API keys and bot tokens live here — never in shared prefs, logs, or
/// analytics. Reads/writes are async and failures surface as [StorageException].
class SecureStorage {
  const SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;

  static const SecureStorage instance = SecureStorage._(
    const FlutterSecureStorage(
      aOptions: const AndroidOptions(
        storageNamespace: AppConfig.secureStorageAndroidPrefs,
      ),
      iOptions: const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
      mOptions: const MacOsOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    ),
  );

  static const String _kProviderApiKeyPrefix = 'provider:';
  static const String _kTelegramBotToken = 'telegram:bot_token';
  static const String _kActiveAgentId = 'agent:active';

  Future<void> saveProviderApiKey(String providerId, String apiKey) async {
    try {
      await _storage.write(
        key: '$_kProviderApiKeyPrefix$providerId',
        value: apiKey,
      );
    } catch (e) {
      AppLogger.error('Failed to save provider key', e);
      throw StorageException('Failed to save provider key', cause: e);
    }
  }

  Future<String?> readProviderApiKey(String providerId) async {
    return _storage.read(
      key: '$_kProviderApiKeyPrefix$providerId',
    );
  }

  Future<void> saveTelegramBotToken(String token) async {
    await _storage.write(
      key: _kTelegramBotToken,
      value: token,
    );
  }

  Future<String?> readTelegramBotToken() async {
    return _storage.read(
      key: _kTelegramBotToken,
    );
  }

  Future<void> saveActiveAgentId(String agentId) async {
    await _storage.write(
      key: _kActiveAgentId,
      value: agentId,
    );
  }

  Future<String?> readActiveAgentId() async {
    return _storage.read(
      key: _kActiveAgentId,
    );
  }
}
