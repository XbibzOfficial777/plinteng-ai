import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

/// A conversation session between a user and one agent.
@freezed
class Conversation with _$Conversation {
  const Conversation({
    required this.id,
    required this.agentId,
    required this.title,
    @Default([]) this.messages,
    @Default(DateTime.now()) this.createdAt,
    @Default(DateTime.now()) this.updatedAt,
  });

  final String id;
  final String agentId;
  final String title;
  final List<Message> messages;
  final DateTime createdAt;
  final DateTime updatedAt;
}

@freezed
class Message with _$Message {
  const Message({
    required this.id,
    required this.role,
    required this.content,
    @Default(false) this.isStreaming,
    @Default(false) this.isError,
    @Default(DateTime.now()) this.createdAt,
  });

  final String id;
  final MessageRole role;
  final String content;
  final bool isStreaming;
  final bool isError;
  final DateTime createdAt;
}

enum MessageRole { user, assistant, system }
