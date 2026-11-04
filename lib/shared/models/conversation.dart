import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

/// A conversation session between a user and one agent.
@freezed
@JsonSerializable()
class Conversation with _$Conversation {
  Conversation._({
    required this.id,
    required this.agentId,
    required this.title,
    List<Message>? messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  })
      : messages = messages ?? const [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Conversation({
    required String id,
    required String agentId,
    required String title,
    @Default([]) List<Message> messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Conversation;

  final String id;
  final String agentId;
  final String title;
  final List<Message> messages;
  final DateTime createdAt;
  final DateTime updatedAt;
}

@freezed
@JsonSerializable()
class Message with _$Message {
  Message._({
    required this.id,
    required this.role,
    required this.content,
    bool? isStreaming,
    bool? isError,
    DateTime? createdAt,
  })
      : isStreaming = isStreaming ?? false,
        isError = isError ?? false,
        createdAt = createdAt ?? DateTime.now();

  factory Message({
    required String id,
    required MessageRole role,
    required String content,
    @Default(false) bool isStreaming,
    @Default(false) bool isError,
    DateTime? createdAt,
  }) = _Message;

  final String id;
  final MessageRole role;
  final String content;
  final bool isStreaming;
  final bool isError;
  final DateTime createdAt;
}

enum MessageRole { user, assistant, system }
