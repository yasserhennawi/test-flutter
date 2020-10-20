// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: RandomWords(title: "passed"),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  final String title;
  final String times;

  RandomWords({Key key, @required this.title, this.times}) : super(key: key);
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<String> words = new List<String>();
  String text = "";
  final myController = TextEditingController();

  _refresh() {
    int times = int.tryParse(text) ?? 1;
    for (var i = 0; i < times; i++) {
      WordPair _wordPair = WordPair.random();
      words.add(_wordPair.toString());
    }
    setState(() {
      words = words;
    });
  }

  _onChanged(String value) {
    setState(() {
      text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        TextField(
          controller: myController,
          decoration: new InputDecoration(labelText: "Enter your number"),
          keyboardType: TextInputType.number,
          onChanged: _onChanged,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
        ...words.map((e) => new Text(e)).toList(),
        FloatingActionButton(
          onPressed: _refresh,
          child: new Icon(IconData(0xe96d, fontFamily: 'MaterialIcons')),
        ),
      ],
    );
  }
}

class RandomText extends StatelessWidget {
  RandomText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}

// class MyCustomForm extends StatefulWidget {
//   @override
//   _MyCustomFormState createState() => _MyCustomFormState();
// }

// // Define a corresponding State class.
// // This class holds the data related to the Form.
// class _MyCustomFormState extends State<MyCustomForm> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
