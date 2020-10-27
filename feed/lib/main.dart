import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './models/details.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: CircleAvatar(
         backgroundImage: NetworkImage("https://images.pexels.com/photos/4431098/pexels-photo-4431098.jpeg?cs=srgb&dl=pexels-cottonbro-4431098.jpg&fm=jpg"),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: null),
          IconButton(icon: Icon(Icons.mail), onPressed: null),
        ],
      ),
      body: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () => {},
                color: Colors.red,
                child: Text("#Trending"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () => {},
                color: Colors.white,
                child: Text("#Food"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.red),
                ),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("#Activity"),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        Expanded(
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: detailData.length,
            itemBuilder: (context, index) => Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                          detailData[index].imageUrl,
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(detailData[index].name),
                          subtitle: Text(detailData[index].time),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(detailData[index].imageUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            onTap: null,
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("Search"),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.adjust),
                title: Text("Search"),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                title: Text("Search"),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text("Search"),
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
