part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String messageContent;
  final bool isSender;

  SendMessageEvent({required this.messageContent, required this.isSender});
}

// Event opsional jika ada fitur load pesan dari API/database
class LoadMessagesEvent extends ChatEvent {}