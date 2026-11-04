import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent.freezed.dart';
part 'agent.g.dart';

/// An AI agent. Each agent owns isolated data: personality, provider
/// config, integrations, automation rules, conversations, activity.
@freezed
@JsonSerializable()
class Agent with _$Agent {
  Agent._({
    required this.id,
    required this.name,
    required this.personality,
    String? customInstructions,
    String? preferredLanguage,
    String? responseLength,
    String? formality,
    bool? humorEnabled,
    String? providerId,
    String? integrationIds,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  })
      : customInstructions = customInstructions ?? '',
        preferredLanguage = preferredLanguage ?? '',
        responseLength = responseLength ?? 'medium',
        formality = formality ?? 'medium',
        humorEnabled = humorEnabled ?? false,
        providerId = providerId ?? '',
        integrationIds = integrationIds ?? '',
        isActive = isActive ?? false,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Agent({
    required String id,
    required String name,
    required String personality,
    @Default('') String customInstructions,
    @Default('') String preferredLanguage,
    @Default('medium') String responseLength,
    @Default('medium') String formality,
    @Default(false) bool humorEnabled,
    @Default('') String providerId,
    @Default('') String integrationIds,
    @Default(false) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Agent;

  final String id;
  final String name;

  // Personality
  final String personality;
  final String customInstructions;
  final String preferredLanguage;

  // Communication style
  final String responseLength; // short | medium | long
  final String formality; // casual | medium | formal
  final bool humorEnabled;

  // Provider + integrations
  final String providerId;
  final String integrationIds; // comma-separated

  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
}
