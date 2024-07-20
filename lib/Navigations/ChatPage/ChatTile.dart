import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/ChatModel.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatTile({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey[50]!),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat.avatarPath),
            ),
            title: Text(
              chat.name,
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Text(
              chat.status,
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            trailing: const Icon(CupertinoIcons.camera),
            onTap: onTap,
          ),
        ));
  }
}
