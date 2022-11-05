import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';



void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'selamat datang',
      home: randomWord(),
    );
  }
}

class randomWord extends StatefulWidget {

  @override
  _randomWordState createState() => _randomWordState();
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
    print(savedWord);
  }

  void savedPage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
      return Scaffold(
        appBar: AppBar(title: Text("saved word"),),
        body: Text(savedWord.join(" - ")),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('aplikasi Random word')),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(randomWord, style: TextStyle(fontSize: 40),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){_savedWord();}, icon: Icon(Icons.favorite_border)),
                IconButton(onPressed: savedPage, icon: Icon(Icons.library_add_outlined))
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: _changeWord, child: Icon(Icons.play_arrow),)
      );
  }
}


