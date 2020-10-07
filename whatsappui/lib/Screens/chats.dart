import 'package:flutter/material.dart';
import 'package:whatsappui/model/model/chat.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messageData.length,
      itemBuilder: (context, i) => Column(
        children: [
          Divider(
            height: 15.0,
          ),
          ListTile(
            leading: CircleAvatar(
              maxRadius: 25.0,
              backgroundImage: NetworkImage(messageData[i].imageUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  messageData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  messageData[i].time,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            subtitle: Text(messageData[i].message),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
