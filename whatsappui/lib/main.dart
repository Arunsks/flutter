import 'package:flutter/material.dart';
import 'package:whatsappui/Screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "whatsApp",
      theme: ThemeData(
          primaryColor: new Color(0xff075E54),
          accentColor: new Color(0xff25D366),
          tabBarTheme: TabBarTheme(labelColor: Colors.white),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.black),
            button: TextStyle(color: Colors.white),
          ),
          bottomAppBarColor: Colors.white),
          home: Home(),
    );
  }
}
