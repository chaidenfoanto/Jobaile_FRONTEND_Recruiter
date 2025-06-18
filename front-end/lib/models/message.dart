// Model sederhana untuk pesan
class Message {
  final String text;
  final bool isSender; // true jika pesan dari kita, false jika dari lawan bicara
  final DateTime timestamp;

  Message({required this.text, required this.isSender, required this.timestamp});
}