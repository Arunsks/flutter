import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "one"),
    NumberAudio("two.wav", Colors.green, "two"),
    NumberAudio("three.wav", Colors.blue, "three"),
    NumberAudio("four.wav", Colors.pink, "four"),
    NumberAudio("five.wav", Colors.orange, "five"),
    NumberAudio("six.wav", Colors.yellow, "six"),
    NumberAudio("seven.wav", Colors.grey, "seven"),
    NumberAudio("eight.wav", Colors.amber, "eight"),
    NumberAudio("nine.wav", Colors.cyan, "nine"),
    NumberAudio("ten.wav", Colors.brown, "ten"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Number"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[0].audioUri);
                      },
                      color: numberList[0].buttonColor,
                      child: Text(numberList[0].buttonText),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[1].audioUri);
                      },
                      color: numberList[1].buttonColor,
                      child: Text(numberList[1].buttonText),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[2].audioUri);
                      },
                      color: numberList[2].buttonColor,
                      child: Text(numberList[2].buttonText),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[3].audioUri);
                      },
                      color: numberList[3].buttonColor,
                      child: Text(numberList[3].buttonText),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[4].audioUri);
                      },
                      color: numberList[4].buttonColor,
                      child: Text(numberList[4].buttonText),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[5].audioUri);
                      },
                      color: numberList[5].buttonColor,
                      child: Text(numberList[5].buttonText),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[6].audioUri);
                      },
                      color: numberList[6].buttonColor,
                      child: Text(numberList[6].buttonText),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[7].audioUri);
                      },
                      color: numberList[7].buttonColor,
                      child: Text(numberList[7].buttonText),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[8].audioUri);
                      },
                      color: numberList[8].buttonColor,
                      child: Text(numberList[8].buttonText),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[9].audioUri);
                      },
                      color: numberList[9].buttonColor,
                      child: Text(numberList[9].buttonText),
                    ),
                  ),
                ],
              ),

              // Expanded(
              //   child: GridView.builder(
              //     padding: EdgeInsets.all(10.0),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: 3.0,
              //         crossAxisSpacing: 10.0,
              //         mainAxisSpacing: 10.0),
              //     itemCount: numberList.length,
              //     itemBuilder: (context, i) => SizedBox(
              //       height: 50.0,
              //       width: 100.0,
              //       child: RaisedButton(
              //         onPressed: () {
              //           play(numberList[i].audioUri);
              //         },
              //         color: numberList[i].buttonColor,
              //         child: Text(
              //           numberList[i].buttonText,
              //           style: TextStyle(color: Colors.white, fontSize: 10.0),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
