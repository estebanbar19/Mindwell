import 'package:flutter/material.dart';
import 'package:foodfast/data/models/Message.dart';

class MessageItem extends StatelessWidget {
  MessageItem({super.key, required this.message});

  Message message;

  @override
  Widget build(BuildContext context) {
    
    Color messageBackgroudColor = message.role == "user" ? const Color.fromARGB(120, 17, 8, 137) : const Color.fromARGB(120, 29, 36, 40);
    Color messageBorderColor = message.role == "user" ? const Color.fromARGB(255, 17, 8, 137) : const Color.fromARGB(255, 29, 36, 40);
    MainAxisAlignment axisAlignment = message.role == "user" ? MainAxisAlignment.end : MainAxisAlignment.start;
    EdgeInsets padding = message.role == "user" ? const EdgeInsets.only(left: 25) : const EdgeInsets.only(right: 25);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: axisAlignment,
        children: [
          Flexible(
            child: Padding(
              padding: padding,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: messageBackgroudColor, border: Border.all(color: messageBorderColor, width: 2)),
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message.content,style: const TextStyle(color: Colors.white), softWrap: true,),
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
