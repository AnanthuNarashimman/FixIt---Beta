import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat2 extends StatelessWidget {
  const Chat2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat with User",
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 45, 147, 165),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                // Receiver's message (left)
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Hi! How can I help you today?",
                    timestamp: "10:30 AM",
                    isSender: false,
                  ),
                ),

                SizedBox(height: 10),

                // Sender's reply (right)
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text: "I need help fixing a leaking tap.",
                    timestamp: "10:31 AM",
                    isSender: true,
                  ),
                ),

                SizedBox(height: 10),

                // Receiver's response (left)
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Sure! I can be there by 2 PM.",
                    timestamp: "10:32 AM",
                    isSender: false,
                  ),
                ),
              ],
            ),
          ),
          const MessageInputBox(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final String timestamp;
  final bool isSender;

  const ChatBubble({
    super.key,
    required this.text,
    required this.timestamp,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: isSender
            ? const Color.fromARGB(255, 231, 247, 250)
            : const Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(14),
          topRight: const Radius.circular(14),
          bottomLeft: Radius.circular(isSender ? 14 : 0),
          bottomRight: Radius.circular(isSender ? 0 : 14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              timestamp,
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageInputBox extends StatelessWidget {
  const MessageInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message...",
                hintStyle: GoogleFonts.poppins(),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color.fromARGB(255, 45, 147, 165)),
            onPressed: () {
              // Send message logic
            },
          ),
        ],
      ),
    );
  }
}