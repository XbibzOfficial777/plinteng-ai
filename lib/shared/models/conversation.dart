import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

/// A conversation session between a user and one agent.
@freezed
class Conversation with _$Conversation {
  Conversation._({
    required this.id,
    required this.agentId,
    required this.title,
    this.messages,
    this.createdAt,
    this.updatedAt,
  })
      : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Conversation({
    required this.id,
    required this.agentId,
    required this.title,
    @Default([]) this.messages,
    this.createdAt,
    this.updatedAt,
  }) = _Conversation;

  final String id;
  final String agentId;
  final String title;
  final List<Message> messages;
  final DateTime createdAt;
  final DateTime updatedAt;
}

@freezed
class Message with _$Message {
  Message._({
    required this.id,
    required this.role,
    required this.content,
    this.isStreaming,
    this.isError,
    this.createdAt,
  })
      : createdAt = createdAt ?? DateTime.now();

  factory Message({
    required this.id,
    required this.role,
    required this.content,
    @Default(false) this.isStreaming,
    @Default(false) this.isError,
    this.createdAt,
  }) = _Message;

  final String id;
  final MessageRole role;
  final String content;
  final bool isStreaming;
  final bool isError;
  final DateTime createdAt;
}

enum MessageRole { user, assistant, system }
