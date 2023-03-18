import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/features/chat/widgets/message_bubble.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
    required FirebaseFirestore firestore,
    required this.loggedInUser,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _firestore.collection('messages').orderBy('createdAt').snapshots(),
      builder: (context, snapshot) {
        List<Widget> messageBubbles = [];

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final messages = snapshot.data!.docs.reversed;

        for (var message in messages) {
          final messageText = (message.data() as Map<String, dynamic>)['text'];
          final messageSender =
              (message.data() as Map<String, dynamic>)['sender'];
          final createdAt =
              (message.data() as Map<String, dynamic>)['createdAt'];

          final messageBubble = MessageBubble(
            text: messageText,
            sender: messageSender,
            createdAt: createdAt,
            isMe: messageSender == loggedInUser.email,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
