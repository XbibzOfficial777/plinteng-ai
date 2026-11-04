import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

/// Activity history records. Persistent, date-grouped, searchable.
@freezed
class ActivityItem with _$ActivityItem {
  const ActivityItem({
    required this.id,
    required this.kind,
    required this.title,
    @Default('') this.details,
    required this.createdAt,
    @Default(ActivityStatus.completed) this.status,
  });

  final String id;
  final ActivityKind kind;
  final String title;
  final String details;
  final DateTime createdAt;
  final ActivityStatus status;
}

enum ActivityKind {
  conversation,
  notification,
  suggestedReply,
  sentReply,
  automation,
  scheduledTask,
  providerEvent,
  error,
}

enum ActivityStatus {
  pending,
  running,
  completed,
  failed,
  cancelled,
}
