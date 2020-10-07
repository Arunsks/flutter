import 'package:flutter/material.dart';
import 'package:whatsappui/model/model/calls.dart';
import '../reusable/Wcards.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Wcards(
            "My Status",
            "https://images.pexels.com/photos/1650281/pexels-photo-1650281.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
            "Upload to status"),
        Heading("RECENT UPDATES"),
        Wcards(callData[0].name, callData[0].imageUrl, callData[0].time),
         Wcards(callData[1].name, callData[1].imageUrl, callData[1].time),
          Wcards(callData[2].name, callData[2].imageUrl, callData[2].time),
      ],
    );
  }
}

class Heading extends StatelessWidget {
  final String heading;
  Heading(this.heading);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0),
      child: Text(
        "RECENT UPDATES",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
