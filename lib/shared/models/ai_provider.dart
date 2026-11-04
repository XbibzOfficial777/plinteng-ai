import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'ai_provider.freezed.dart';
part 'ai_provider.g.dart';

/// Supported AI providers.
enum AiProviderType {
  openai,
  gemini,
  anthropic,
  openaiCompatible,
}

/// AI provider configuration. Credentials are NOT stored here — only
/// metadata. The API key lives in secure storage keyed by providerId.
@freezed
@JsonSerializable()
class AiProvider with _$AiProvider {
  AiProvider._({
    required this.id,
    required this.type,
    required this.name,
    String? baseUrl,
    List<String>? models,
    String? defaultModel,
    bool? isDefault,
    ConnectionStatus? status,
    DateTime? createdAt,
  })
      : baseUrl = baseUrl ?? '',
        models = models ?? const [],
        defaultModel = defaultModel ?? '',
        isDefault = isDefault ?? false,
        status = status ?? ConnectionStatus.unverified,
        createdAt = createdAt ?? DateTime.now();

  factory AiProvider({
    required String id,
    required AiProviderType type,
    required String name,
    @Default('') String baseUrl,
    @Default([]) List<String> models,
    @Default('') String defaultModel,
    @Default(false) bool isDefault,
    @Default(ConnectionStatus.unverified) ConnectionStatus status,
    DateTime? createdAt,
  }) = _AiProvider;

  final String id;
  final AiProviderType type;
  final String name;
  final String baseUrl;
  final List<String> models;
  final String defaultModel;
  final bool isDefault;
  final ConnectionStatus status;
  final DateTime createdAt;

  static AiProvider openai() => AiProvider(
        id: 'openai',
        type: AiProviderType.openai,
        name: 'OpenAI',
        defaultModel: 'gpt-4o-mini',
        models: const ['gpt-4o-mini', 'gpt-4o', 'gpt-4.1', 'o3-mini'],
      );

  static AiProvider gemini() => AiProvider(
        id: 'gemini',
        type: AiProviderType.gemini,
        name: 'Google Gemini',
        baseUrl: 'https://generativelanguage.googleapis.com',
        defaultModel: 'gemini-2.5-flash',
        models: const [
          'gemini-2.5-flash',
          'gemini-2.5-pro',
          'gemini-2.0-flash',
        ],
      );

  static AiProvider anthropic() => AiProvider(
        id: 'anthropic',
        type: AiProviderType.anthropic,
        name: 'Anthropic Claude',
        baseUrl: 'https://api.anthropic.com',
        defaultModel: 'claude-sonnet-4-20250514',
        models: const [
          'claude-sonnet-4-20250514',
          'claude-opus-4-20250514',
          'claude-haiku-4-20250514',
        ],
      );
}

enum ConnectionStatus {
  unverified,
  connecting,
  connected,
  failed,
}
