import 'package:flutter/material.dart';

class savedWordScreen extends StatelessWidget {
  List<String> savedWord = [];
  savedWordScreen({required this.savedWord});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('saved word')),
      body: Center(
        child: Text(savedWord.join(' - '), style: TextStyle(fontSize: 40),),
      ),
    );
  }
}