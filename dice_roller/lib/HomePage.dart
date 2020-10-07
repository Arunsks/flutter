import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage diceImage;
  AssetImage diceImg;

  @override
  void initState() {
    super.initState();
    setState(() {
      diceImage = one;
      diceImg = five;
    });
  }

  void diceRoller() {
    var random = (1 + Random().nextInt(6));
    var rnd = (1 + Random().nextInt(6));

    AssetImage newImage;
    AssetImage secondImage;

    switch (random) {
      case 1:
        newImage = one;
        break;
      case 2:
        newImage = two;
        break;
      case 3:
        newImage = three;
        break;
      case 4:
        newImage = four;
        break;
      case 5:
        newImage = five;
        break;
      case 6:
        newImage = six;
        break;
    }

    switch (rnd) {
      case 1:
        secondImage = one;
        break;
      case 2:
        secondImage = two;
        break;
      case 3:
        secondImage = three;
        break;
      case 4:
        secondImage = four;
        break;
      case 5:
        secondImage = five;
        break;
      case 6:
        secondImage = six;
        break;
    }

    setState(() {
      diceImage = newImage;
      diceImg = secondImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice ROller',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Image(
                  image: diceImage,
                  width: 100.0,
                  height: 100.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                ),
                Image(
                  image: diceImg,
                  height: 100.0,
                  width: 100.0,
                ),
              ],),
            ),
               Container(
                margin: EdgeInsets.only(top: 50),
              ),
              RaisedButton(
                onPressed: diceRoller,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: Colors.yellow,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Text(
                  'Roll the Dice!',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
