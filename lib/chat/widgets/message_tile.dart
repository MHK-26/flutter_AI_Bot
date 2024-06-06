import 'package:ai_bot/chat/chat.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: message.isUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(12).subtract(
              BorderRadius.only(
                bottomRight:
                    message.isUser ? Radius.zero : const Radius.circular(12),
                bottomLeft:
                    !message.isUser ? Radius.zero : const Radius.circular(12),
              ),
            ),
          ),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isUser ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
