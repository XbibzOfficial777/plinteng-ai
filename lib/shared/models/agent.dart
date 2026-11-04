import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent.freezed.dart';
part 'agent.g.dart';

/// An AI agent. Each agent owns isolated data: personality, provider
/// config, integrations, automation rules, conversations, activity.
@freezed
class Agent with _$Agent {
  Agent._({
    required this.id,
    required this.name,
    required this.personality,
    this.customInstructions,
    this.preferredLanguage,
    this.responseLength,
    this.formality,
    this.humorEnabled,
    this.providerId,
    this.integrationIds,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  })
      : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Agent({
    required this.id,
    required this.name,
    required this.personality,
    @Default('') this.customInstructions,
    @Default('') this.preferredLanguage,
    @Default('medium') this.responseLength,
    @Default('medium') this.formality,
    @Default(false) this.humorEnabled,
    @Default('') this.providerId,
    @Default('') this.integrationIds,
    @Default(false) this.isActive,
    this.createdAt,
    this.updatedAt,
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
