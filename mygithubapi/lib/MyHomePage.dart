import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({@required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://api.github.com/users";
  List data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future<String> getjsondata() async {
    var response = await http.get(Uri.encodeFull(url));

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
         return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.notifications_active),
                  title: Text(data[index]["login"],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(
                    data[index]["id"].toString(),
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
