import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.text,
    required this.sender,
    required this.createdAt,
    required this.isMe,
  });

  final String text;
  final String sender;
  final Timestamp createdAt;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:
                  isMe ? const Radius.circular(30) : const Radius.circular(0),
              topRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(30),
              bottomLeft: const Radius.circular(30),
              bottomRight: const Radius.circular(30),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
