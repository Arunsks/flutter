import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drawer App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("ArunSks"),
              accountEmail: Text("arunsks98@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("AK"),
              ),
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Category'),
              trailing: Icon(Icons.category),
              onTap: () => Navigator.of(context).pushNamed('/a'),
            ),
            Divider(),
            ListTile(
              title: Text('profile'),
              trailing: Icon(Icons.more),
              onTap: () => Navigator.of(context).pushNamed("/p") ,
            ),
            ListTile(
              title: Text('Mascot'),
              trailing: Icon(Icons.mode_comment),
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("My Home Page"),
      ),
    );
  }
}
