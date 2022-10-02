import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  MessageBubble({this.sender, this.text, this.isMe, this.currentTime});
  final String sender;
  final String text;
  final Timestamp currentTime;
  bool isMe;
  Color messageColour ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: (isMe)?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(topLeft: isMe?Radius.circular(30):Radius.circular(0),topRight:isMe?Radius.circular(0):Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
            elevation: 5.0,
            color: (isMe)?
            Colors.lightBlueAccent :
            Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Column(
                children: [Text(
                  '$text',
                  style: TextStyle(fontSize: 15.0, color: (isMe)?Colors.white:Colors.black),
                ),

                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
