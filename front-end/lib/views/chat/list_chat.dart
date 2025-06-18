import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_match/color/color.dart';
// Import ChatPage dan BLoC-nya
import 'chat.dart'; // Pastikan path ini benar ke ChatPage
import '/BLoC/chat/chat_bloc.dart'; // Pastikan path ini benar ke ChatBloc
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import '/models/list_message.dart'; // Ganti dengan path yang benar ke ChatListItem

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  // Dummy data untuk daftar chat
  final List<ChatListItem> _chatItems = [
    ChatListItem(
      name: 'Nur Harmawati Kudus',
      imageUrl: 'assets/images/helper_dashboard/helper1.png', // <-- UBAH DI SINI UNTUK GAMBAR NUR
      lastMessage: 'Oh iya baik buu..',
      unreadCount: 1,
    ),
    ChatListItem(
      name: 'Kiran Natasya Kenta',
      imageUrl: 'assets/images/helper_dashboard/helper4.png', // <-- UBAH DI SINI UNTUK GAMBAR KIRAN (jika sama)
      lastMessage: 'Iya, mau bu!',
      unreadCount: 0,
    ),
    ChatListItem(
      name: 'Yuni Lestari',
      imageUrl: 'assets/images/helper_dashboard/helper3.png', // <-- UBAH DI SINI UNTUK GAMBAR YUNI (jika sama)
      lastMessage: 'Okay bu',
      unreadCount: 0,
    ),
    // Tambahkan lebih banyak dummy data jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Chat',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: _chatItems.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 0.5,
                indent: 0.0, // Diatur menjadi 0.0
                endIndent: 0.0,
              ),
              itemBuilder: (context, index) {
                final item = _chatItems[index];
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => ChatBloc(),
                            child: const ChatScreen(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(item.imageUrl), // <-- UBAH DI SINI
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.lastMessage,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        if (item.unreadCount > 0)
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                item.unreadCount.toString(),
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}