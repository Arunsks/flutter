import 'package:flutter/material.dart';
import 'package:whatsappui/model/model/calls.dart';


class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callData.length,
      itemBuilder: (context, i) => Column(
        children: [
          Divider(
            height: 15.0,
          ),
          ListTile(
            leading: CircleAvatar(
              maxRadius: 25.0,
              backgroundImage: NetworkImage(callData[i].imageUrl),
            ),
            title: Row(
              children: [
                Text(
                  callData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Text(callData[i].time),
            onTap: () {},
            trailing: Icon(Icons.call),
            selected: true,
          ),
        ],
      ),
    );
  }
}
