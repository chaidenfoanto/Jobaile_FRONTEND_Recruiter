class ChatListItem {
  final String name;
  final String imageUrl;
  final String lastMessage;
  final int unreadCount;
  final String? routeName; // <-- Ubah menjadi opsional dengan '?'

  ChatListItem({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    this.unreadCount = 0,
    this.routeName, // <-- Hapus 'required' di sini
  });
}