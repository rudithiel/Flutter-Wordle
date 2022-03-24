import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'dart:math';
import 'wordlist.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

void main() {
  runApp(Wordle());
}

class Wordle extends StatefulWidget {
  const Wordle({Key? key}) : super(key: key);

  @override
  State<Wordle> createState() => _WordleState();
}

class _WordleState extends State<Wordle> {
  FocusNode focusNode = FocusNode();
  String word = kWordList[Random().nextInt(kWordList.length) + 1].toUpperCase();
  int currentWord = 0;
  List<String> words = ['', '', '', '', '', ''];
  List sequences = [
    [0,0,0,0,0],
    [0,0,0,0,0],
    [0,0,0,0,0],
    [0,0,0,0,0],
    [0,0,0,0,0],
    [0,0,0,0,0]
  ];
  final _controller = TextEditingController();
  void updateWord(char) {
    setState(() {
      print(word);
      if (char == 'DEL') {
        words[currentWord] =
            words[currentWord].substring(0, words[currentWord].length - 1);
      } else if (char == 'ENTER') {
        if (words[currentWord].length == 5) {
          if (kWordList.contains(words[currentWord].toLowerCase())) {
            for(int i = 0; i < 5; i++) {
              if (words[currentWord][i] == word[i]) {
                //  Correct letter and place
                sequences[currentWord][i] = 3;
              } else if (word.contains(words[currentWord][i])) {
                sequences[currentWord][i] = 2;
              } else {
                sequences[currentWord][i] = 1;
              }
            }
            currentWord++;
          } else {

          }


        }
      } else if (words[currentWord].length < 5){
        words[currentWord] += char;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xFF808384)),
          )
        )
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF121213),
        appBar: AppBar(
          backgroundColor: Color(0xFF121213),
          title: const Text(
            'Wordle',
            style: TextStyle(
                fontSize: 45,
              fontFamily: 'Karnak'
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                WordleRow(
                  word: words[0].padRight(5, ' '),
                  sequence: sequences[0],
                ),
                WordleRow(
                  word: words[1].padRight(5, ' '),
                  sequence: sequences[1],
                ),
                WordleRow(
                  word: words[2].padRight(5, ' '),
                  sequence: sequences[2],
                ),
                WordleRow(
                  word: words[3].padRight(5, ' '),
                  sequence: sequences[3],
                ),
                WordleRow(
                  word: words[4].padRight(5, ' '),
                  sequence: sequences[4],
                ),
                WordleRow(
                  word: words[5].padRight(5, ' '),
                  sequence: sequences[5],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Keyboard(
                    notifyGame: updateWord,
                  ),
                )

                // TextField(
                //   controller: _controller,
                //   focusNode: focusNode,
                //   showCursor: false,
                //   enableSuggestions: false,
                //   autocorrect: false,
                //   maxLength: 5,
                //   scrollPadding: EdgeInsets.all(0),
                //   style: TextStyle(
                //     fontSize: 0,
                //   ),
                //   decoration: InputDecoration(
                //       focusColor: Colors.white,
                //       focusedBorder: InputBorder.none,
                //       disabledBorder: InputBorder.none,
                //       enabledBorder: InputBorder.none,
                //       helperMaxLines: 0),
                //   onChanged: (value) {
                //     setState(() {
                //       words[currentWord] = value.padRight(5, ' ');
                //     });
                //   },
                //   onSubmitted: (value) {
                //     f
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WordleRow extends StatelessWidget {
  const WordleRow({Key? key, required this.word, required this.sequence}) : super(key: key);
  final String word;
  final List sequence;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          LetterBox(
            char: word[0],
            state: sequence[0],
          ),
          LetterBox(
            char: word[1],
            state: sequence[1],
          ),
          LetterBox(
            char: word[2],
            state: sequence[2],
          ),
          LetterBox(
            char: word[3],
            state: sequence[3],
          ),
          LetterBox(
            char: word[4],
            state: sequence[4],
          ),
        ],
      ),
    );
  }
}

class LetterBox extends StatelessWidget {
  const LetterBox({Key? key, this.char = '', this.state = 0}) : super(key: key);
  final String char;
  final int state;
  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    Color borderColor = Color(0xFF3A3A3C);
    switch (state) {
      case 0:
        color = Colors.transparent;
        break;
      case 1:
        color = Color(0xFF3A3A3C);
        borderColor = color;
        break;
      case 2:
        color = Color(0xFFB69F3B);
        borderColor = color;
        break;
      case 3:
        color = Color(0xFF538D4E);
        borderColor = color;
        break;
    }
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: EdgeInsets.all(3.5),
          child: Center(
            child: Text(
              char.toUpperCase(),
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: borderColor,
                width: 3
            ),
          ),
        ),
      ),
    );
  }
}
