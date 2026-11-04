import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config/app_config.dart';
import '../errors/app_exceptions.dart';
import '../utilities/logger.dart';

/// Secure storage wrapper for credentials.
///
/// API keys and bot tokens live here — never in shared prefs, logs, or
/// analytics. Reads/writes are async and failures surface as [StorageException].
class SecureStorage {
  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;

  static const SecureStorage instance = SecureStorage._(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(
       encryptedSharedPreferencesFileName:
           'plinteng_secure_prefs.xml',
      encryptedSharedPreferencesMode: EncryptedSharedPreferencesMode.encrypted,
    ),
    iOptions: IOSOptions(
       accessibility: SecureStorageType.firstUnlockThisDeviceOnly,
        sharedPreferencesName: 'plinteng_secure_prefs',
    ),
    mOptions: MacOSOptions(
       accessibility: SecureStorageType.firstUnlockThisDeviceOnly,
       sharedPreferencesName: 'plinteng_secure_prefs',
    ),
  ),
);

  static const String _kProviderApiKeyPrefix = 'provider:';
  static const String _kTelegramToken = 'telegram:bot_token';
  static const String _kActiveAgentId = 'agent:active';

  Future<void> saveProviderApiKey(String providerId, String apiKey) async {
    try {
      await _storage.write(
        key: '$_kProviderApiKeyPrefix$providerId',
        value: apiKey,
        options: const StorageOptions(
          iosKeychainPreface: AppConfig.secureStorageIosPrefix,
          androidSharedPreferencesName:
              AppConfig.secureStorageAndroidPrefs,
        ),
      );
    } catch (e, st) {
      AppLogger.error('Failed to save provider key', e);
      throw StorageException('Failed to save provider key', cause: e);
    }
  }

  Future<String?> readProviderApiKey(String providerId) async {
    return _storage.read(
      key: '$_kProviderApiKeyPrefix$providerId',
      options: const StorageOptions(
        iosKeychainPreface: AppConfig.secureStorageIosPrefix,
        androidSharedPreferencesName: AppConfig.secureStorageAndroidPrefs,
      ),
    );
  }

  Future<void> saveTelegramBotToken(String token) async {
    await _storage.write(
      key: _kTelegramToken,
      value: token,
      options: const StorageOptions(
        iosKeychainPreface: AppConfig.secureStorageIosPrefix,
        androidSharedPreferencesName: AppConfig.secureStorageAndroidPrefs,
      ),
    );
  }

  Future<String?> readTelegramBotToken() async {
    return _storage.read(
      key: _kTelegramToken,
      options: const StorageOptions(
        iosKeychainPreface: AppConfig.secureStorageIosPrefix,
        androidSharedPreferencesName: AppConfig.secureStorageAndroidPrefs,
      ),
    );
  }

  Future<void> saveActiveAgentId(String agentId) async {
    await _storage.write(
      key: _kActiveAgentId,
      value: agentId,
      options: const StorageOptions(
        iosKeychainPreface: AppConfig.secureStorageIosPrefix,
        androidSharedPreferencesName: AppConfig.secureStorageAndroidPrefs,
      ),
    );
  }

  Future<String?> readActiveAgentId() async {
    return _storage.read(
      key: _kActiveAgentId,
      options: const StorageOptions(
        iosKeychainPreface: AppConfig.secureStorageIosPrefix,
        androidSharedPreferencesName: AppConfig.secureStorageAndroidPrefs,
      ),
    );
  }
}
