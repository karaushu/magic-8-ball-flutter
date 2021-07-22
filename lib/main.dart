import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const ANSWERS = <String>[
  'Well... NO',
  'NO',
  'Nope',
  'IDK',
  'Ask later',
  'Yes',
  'Yep',
  'Sure',
  'Absolutely'
];

void main() => runApp(
      MaterialApp(
        home: MagicEight(),
      ),
    );

class MagicEight extends StatefulWidget {
  @override
  _MagicEightState createState() => _MagicEightState();
}

class _MagicEightState extends State<MagicEight> {
  final int maxLength = ANSWERS.length;
  String answer = 'Ask anything';
  bool rotating = false;

  String _getRandomAnswer() {
    int random = Random().nextInt(maxLength);

    return ANSWERS[random];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            answer = _getRandomAnswer();
            rotating = true;
          });
          Future.delayed(const Duration(milliseconds: 750), () {
            setState(() {
              rotating = false;
            });
          });
        },
        backgroundColor: Colors.blueGrey.shade800,
        child: Text(
          'Ask',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade200,
        title: Text('Ask a question'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: MagicBall(
              answer: answer,
              rotating: rotating,
            ),
          ),
        ],
      ),
    );
  }
}

class MagicBall extends StatelessWidget {
  const MagicBall({
    this.answer,
    this.rotating,
  }) : super();

  final String answer;
  final bool rotating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade300,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade300],
        ),
      ),
      width: 200,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            width: 100,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                rotating
                    ? CircularProgressIndicator(
                        color: Colors.blueGrey.shade800,
                      )
                    : Text(
                        answer,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade800),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
