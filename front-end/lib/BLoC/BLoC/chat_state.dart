part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;

  ChatLoaded({required this.messages});

  // Untuk memungkinkan salinan state dengan perubahan
  ChatLoaded copyWith({
    List<Message>? messages,
  }) {
    return ChatLoaded(
      messages: messages ?? this.messages,
    );
  }
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}