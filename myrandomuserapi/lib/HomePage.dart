import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://randomuser.me/api/?results=50";
  bool isloading = true;
  List userData;

  @override
  void initState() {
    super.initState();
    this.getjson();
  }

  Future<String> getjson() async {
    var response = await http.get(Uri.encodeFull(url));

    List data = jsonDecode(response.body)["results"];

    setState(() {
      userData = data;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random user api 2'),
      ),
      body: Container(
        child: Center(
          child: isloading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Image(
                              height: 70.0,
                              width: 70.0,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  userData[index]["picture"]["thumbnail"]),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  userData[index]['name']['first'] +
                                      " " +
                                      userData[index]['name']['last'],
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(padding: EdgeInsets.all(3.0)),
                                ListTile(
                                  leading: Icon(Icons.phone),
                                  title: Text("${userData[index]["phone"]}"),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 40.0, 0.0),
                                  child: Text(
                                    "Gender: ${userData[index]["gender"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 40.0, 10.0),
                                  child: Text(
                                    "Age: ${userData[index]["dob"]["age"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
