import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

/// Activity history records. Persistent, date-grouped, searchable.
@freezed
@JsonSerializable()
class ActivityItem with _$ActivityItem {
  ActivityItem._({
    required this.id,
    required this.kind,
    required this.title,
    required this.createdAt,
    String? details,
    ActivityStatus? status,
  })
      : details = details ?? '',
        status = status ?? ActivityStatus.completed;

  const factory ActivityItem({
    required String id,
    required ActivityKind kind,
    required String title,
    @Default('') String details,
    required DateTime createdAt,
    @Default(ActivityStatus.completed) ActivityStatus status,
  }) = _ActivityItem;

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
