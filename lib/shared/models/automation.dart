import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'automation.freezed.dart';
part 'automation.g.dart';

/// A scheduled task assigned to an agent.
@freezed
@JsonSerializable()
class ScheduledTask with _$ScheduledTask {
  ScheduledTask._({
    required this.id,
    required this.agentId,
    required this.title,
    required this.scheduledAt,
    TaskStatus? status,
    String? instruction,
    DateTime? createdAt,
  })
      : status = status ?? TaskStatus.pending,
        instruction = instruction ?? '',
        createdAt = createdAt ?? DateTime.now();

  factory ScheduledTask({
    required String id,
    required String agentId,
    required String title,
    required DateTime scheduledAt,
    @Default(TaskStatus.pending) TaskStatus status,
    @Default('') String instruction,
    DateTime? createdAt,
  }) = _ScheduledTask;

  final String id;
  final String agentId;
  final String title;
  final DateTime scheduledAt;
  final TaskStatus status;
  final String instruction;
  final DateTime createdAt;
}

enum TaskStatus { pending, scheduled, running, completed, failed, cancelled }

/// An automation rule (trigger → conditions → action).
@freezed
@JsonSerializable()
class AutomationRule with _$AutomationRule {
  AutomationRule._({
    required this.id,
    required this.name,
    required this.trigger,
    required this.agentId,
    String? instruction,
    ExecutionPolicy? executionPolicy,
    bool? isEnabled,
    DateTime? createdAt,
  })
      : instruction = instruction ?? '',
        executionPolicy = executionPolicy ?? ExecutionPolicy.manualApproval,
        isEnabled = isEnabled ?? true,
        createdAt = createdAt ?? DateTime.now();

  factory AutomationRule({
    required String id,
    required String name,
    required AutomationTrigger trigger,
    required String agentId,
    @Default('') String instruction,
    @Default(ExecutionPolicy.manualApproval) ExecutionPolicy executionPolicy,
    @Default(true) bool isEnabled,
    DateTime? createdAt,
  }) = _AutomationRule;

  final String id;
  final String name;
  final AutomationTrigger trigger;
  final String agentId;
  final String instruction;
  final ExecutionPolicy executionPolicy;
  final bool isEnabled;
  final DateTime createdAt;
}

enum AutomationTrigger {
  notification,
  scheduled,
  manual,
}

enum ExecutionPolicy {
  // Always ask the user before executing.
  manualApproval,
  // Execute automatically (explicitly enabled by the user).
  automatic,
}
