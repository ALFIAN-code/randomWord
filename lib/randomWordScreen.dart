import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';
import 'savedPageScreen.dart';

class randomWord extends StatefulWidget {
  @override
  State<randomWord> createState() => _randomWordState();
}

class _randomWordState extends State<randomWord> {

  String randomWord = WordPair.random().asString;
  List<String> savedWord = [];

  void _changeWord(){
    setState(() {
      randomWord = WordPair.random().asString;
    });
  }

  void _savedWord(){
    savedWord.add(randomWord);
  }

  void _savedScreen(){
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => savedWordScreen(savedWord: savedWord,),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('random Word'),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(randomWord, style: TextStyle(fontSize: 40),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: _savedWord, icon: Icon(Icons.favorite_border_outlined)),
                IconButton(onPressed: _savedScreen, icon: Icon(Icons.library_books))
              ],
            )
          ],
        )
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: _changeWord ,child: Icon(Icons.play_arrow),),
    );
  }
}
