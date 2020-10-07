import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//get image method
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage edit = AssetImage('images/edit.png');

  bool iscross = true;
  String message;
  List<String> gamestate;

//initializing value both empty

  @override
  void initState() {
    super.initState();

    this.gamestate = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];

    this.message = "";
  }

  //get image method
   getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  //playgame method
  playGame(int index) {
    if (gamestate[index] == "empty")
      setState(() {
        if (this.iscross) {
          gamestate[index] = "cross";
        } else {
          gamestate[index] = "circle";
        }
        this.iscross = !this.iscross;
      });
      this.checkWin();
  }

  //reset logic
  void resetGame() {
    setState(() {
      this.gamestate = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      this.message = "";

    
    });
  }

//check win logic
  checkWin() {
    if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[1]) &&
        gamestate[1] == gamestate[2]) {
      setState(() {
        this.message = "${gamestate[0]} wins";
      });
    } else if ((gamestate[3] != "empty") &&
        (gamestate[3] == gamestate[4]) &&
        gamestate[4] == gamestate[5]) {
      setState(() {
        this.message = "${gamestate[3]} wins";
      });
    } else if ((gamestate[6] != "empty") &&
        (gamestate[6] == gamestate[7]) &&
        gamestate[7] == gamestate[8]) {
      setState(() {
        this.message = "${gamestate[6]} wins";
      });
    } else if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[3]) &&
        gamestate[3] == gamestate[6]) {
      setState(() {
        this.message = "${gamestate[0]} wins";
      });
    } else if ((gamestate[1] != "empty") &&
        (gamestate[1] == gamestate[4]) &&
        gamestate[4] == gamestate[7]) {
      setState(() {
        this.message = "${gamestate[1]} wins";
      });
    } else if ((gamestate[2] != "empty") &&
        (gamestate[2] == gamestate[5]) &&
        gamestate[5] == gamestate[8]) {
      setState(() {
        this.message = "${gamestate[2]} wins";
      });
    } else if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[4]) &&
        gamestate[4] == gamestate[8]) {
      setState(() {
        this.message = "${gamestate[0]} wins";
      });
    } else if ((gamestate[2] != "empty") &&
        (gamestate[2] == gamestate[4]) &&
        gamestate[4] == gamestate[6]) {
      setState(() {
        this.message = "${gamestate[2]} wins";
      });
    } else if (!gamestate.contains("empty")) {
      this.message = "match draw";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 7.0,
            ),
            itemCount: this.gamestate.length,
            itemBuilder: (context, i) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  playGame(i);
                },
                child: Image(
                  image: getImage(this.gamestate[i]),
                ),
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            minWidth: 300.0,
            height: 50.0,
            color: Colors.orange,
            onPressed: () {
              resetGame();
            },
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Reset Game",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'LearnCodeOnline.in',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "A project by arunsks",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
