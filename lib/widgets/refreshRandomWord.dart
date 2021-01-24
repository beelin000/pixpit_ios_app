import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RefreshRandomWord extends StatefulWidget {
  RefreshRandomWord({Key key}) : super(key: key);
  
  @override
  _RefreshRandomWordState createState() => _RefreshRandomWordState();
}

class _RefreshRandomWordState extends State<RefreshRandomWord> {
  String randomWord = "start";

  void _nextRandomWord(){
    setState(() {
      randomWord = new WordPair.random().toString();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("refresh random word"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(randomWord),
            RaisedButton(
              child: Text("Refresh"),
              onPressed: () => _nextRandomWord()),
          ],
        ),
      ),
    );
  }
}
