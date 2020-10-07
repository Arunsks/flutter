import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // import images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  // get an array

  List<String> itemArray;
  int luckyNumber;
  int attempts = 0;

  // array with 25 elements

  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);

    setState(() {
      luckyNumber = random;
    });
  }

  // get image method
  AssetImage getImage(int index) {
    String currentState = itemArray[index];

    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }

  // play game method
  playGame(int index) {
    if (attempts < 5) {
      if (luckyNumber == index) {
        setState(() {
          itemArray[index] = "lucky";
          attempts = attempts + 1;
        });
      } else {
        setState(() {
          itemArray[index] = "unlucky";
          attempts = attempts + 1;
        });
      }
    } else {
      showAll();
    }
  }

  // showall method
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  // resetall method
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
    });

    generateRandomNumber();

    attempts = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scratch and win"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 7.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                height: 30.0,
                width: 30.0,
                child: RaisedButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(image: this.getImage(i)),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: RaisedButton(
              color: Colors.pink,
              onPressed: () {
                showAll();
              },
              child: Text(
                "Show All",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: RaisedButton(
              color: Colors.pink,
              onPressed: () {
                resetGame();
              },
              child: Text(
                "Reset",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                "LearnCodeOnline.in",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
