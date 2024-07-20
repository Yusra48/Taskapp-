import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navigations/ChatPage/ChatService.dart';
import 'package:flutter_application_1/Navigations/ChatPage/ChatTile.dart';
import 'package:flutter_application_1/Models/ChatModel.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatService _chatService = ChatService();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _chatService.loadChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Chats',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: StreamBuilder<List<Chat>>(
              stream: _chatService.getChats(query: _searchQuery),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No chats found'));
                }
                var chats = snapshot.data!;
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return ChatTile(
                        chat: chats[index],
                        onTap: () {
                          _sendMessage(chats[index]);
                        });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(Chat chat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessageScreen(chat: chat),
      ),
    );
  }
}


class MessageScreen extends StatefulWidget {
  final Chat chat;

  MessageScreen({required this.chat});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message); 
      });
      _messageController.clear(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${widget.chat.name}',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, 
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSent = index % 2 == 0; 
                return Align(
                  alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: isSent ? Colors.deepPurpleAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: isSent ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Icon(Icons.send, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), backgroundColor: Colors.deepPurpleAccent,
                    padding: EdgeInsets.all(16.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
