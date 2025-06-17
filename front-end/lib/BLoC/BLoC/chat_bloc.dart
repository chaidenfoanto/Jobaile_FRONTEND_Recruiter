import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:chat/models/message.dart'; // Import model pesan

part 'chat_event.dart';
part 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // Dummy data awal - Disesuaikan agar majikan (isSender: true) bertanya duluan
  final List<Message> _messages = [
    // Majikan (Pengirim - isSender: true) bertanya duluan
    Message(text: 'Kamu punya keahlian dalam memasak tidak?', isSender: true, timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
    // Balasan dari Pekerja (Penerima - isSender: false)
    Message(text: 'Saya bisa memasak makanan itali karena sebelumnya pernah bekerja di restoran itali bu..', isSender: false, timestamp: DateTime.now().subtract(const Duration(minutes: 4))),
    // Majikan (Pengirim - isSender: true) membalas
    Message(text: 'Oh oke, saya mikir dulu ya', isSender: true, timestamp: DateTime.now().subtract(const Duration(minutes: 3))),
    // Balasan dari Pekerja (Penerima - isSender: false)
    Message(text: 'Oh iya baik buu..', isSender: false, timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
  ];

  ChatBloc() : super(ChatInitial()) {
    on<LoadMessagesEvent>((event, emit) async {
      emit(ChatLoading());
      try {
        await Future.delayed(const Duration(milliseconds: 500));
        emit(ChatLoaded(messages: List.from(_messages)));
      } catch (e) {
        emit(ChatError('Gagal memuat pesan: $e'));
      }
    });

    on<SendMessageEvent>((event, emit) async {
      if (state is ChatLoaded) {
        final currentMessages = (state as ChatLoaded).messages;
        final newMessage = Message(
          text: event.messageContent,
          isSender: event.isSender,
          timestamp: DateTime.now(),
        );
        final updatedMessages = List<Message>.from(currentMessages)..add(newMessage);
        emit(ChatLoaded(messages: updatedMessages));

        // --- Logika Simulasi Balasan Otomatis (sesuai POV baru) ---
        if (event.isSender) { // Jika pesan datang dari "kita" (Majikan)
          await Future.delayed(const Duration(seconds: 1)); // Tunggu 1 detik

          String replyText = "Baik, saya akan coba untuk itu!"; // Default reply

          if (event.messageContent.toLowerCase().contains('terima kasih') || event.messageContent.toLowerCase().contains('makasih')) {
            replyText = "Sama-sama!";
          } else if (event.messageContent.toLowerCase().contains('halo') || event.messageContent.toLowerCase().contains('hai')) {
            replyText = "Halo juga!";
          } else if (event.messageContent.toLowerCase().contains('apa kabar')) {
            replyText = "Baik-baik saja, Anda bagaimana?";
          } else if (event.messageContent.toLowerCase().contains('pekerjaan') || event.messageContent.toLowerCase().contains('tugas')) {
            replyText = "Siap melaksanakan tugas!";
          } else {
            replyText = "Oke, saya paham.";
          }

          final replyMessage = Message(
            text: replyText,
            isSender: false, // Pesan ini dari "lawan bicara" (Pekerja)
            timestamp: DateTime.now(),
          );
          final updatedWithReply = List<Message>.from(updatedMessages)..add(replyMessage);
          emit(ChatLoaded(messages: updatedWithReply));
        }
        // --- Akhir Logika Simulasi Balasan Otomatis ---

      } else {
        emit(ChatLoaded(messages: [Message(
          text: event.messageContent,
          isSender: event.isSender,
          timestamp: DateTime.now(),
        )]));
      }
    });
  }
}