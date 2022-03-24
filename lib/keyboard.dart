import 'package:flutter/material.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey(
      {Key? key,
      required this.char,
      required this.notifyKeyboard,
      this.aspectRatio = 0.8})
      : super(key: key);
  final String char;
  final double aspectRatio;
  final Function() notifyKeyboard;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: TextButton(
            onPressed: notifyKeyboard,
            child: Center(
              child: Text(
                char,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.notifyGame}) : super(key: key);
  final Function(String word) notifyGame;

  void pressed(String char) {
    notifyGame(char);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                KeyboardKey(
                  char: 'Q',
                  notifyKeyboard: () => pressed('Q'),
                ),
                KeyboardKey(
                  char: 'W',
                  notifyKeyboard: () => pressed('W'),
                ),
                KeyboardKey(
                  char: 'E',
                  notifyKeyboard: () => pressed('E'),
                ),
                KeyboardKey(
                  char: 'R',
                  notifyKeyboard: () => pressed('R'),
                ),
                KeyboardKey(
                  char: 'T',
                  notifyKeyboard: () => pressed('T'),
                ),
                KeyboardKey(
                  char: 'Y',
                  notifyKeyboard: () => pressed('Y'),
                ),
                KeyboardKey(
                  char: 'U',
                  notifyKeyboard: () => pressed('U'),
                ),
                KeyboardKey(
                  char: 'I',
                  notifyKeyboard: () => pressed('I'),
                ),
                KeyboardKey(
                  char: 'O',
                  notifyKeyboard: () => pressed('O'),
                ),
                KeyboardKey(
                  char: 'P',
                  notifyKeyboard: () => pressed('P'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                KeyboardKey(
                  char: 'A',
                  notifyKeyboard: () => pressed('A'),
                ),
                KeyboardKey(
                  char: 'S',
                  notifyKeyboard: () => pressed('S'),
                ),
                KeyboardKey(
                  char: 'D',
                  notifyKeyboard: () => pressed('D'),
                ),
                KeyboardKey(
                  char: 'F',
                  notifyKeyboard: () => pressed('F'),
                ),
                KeyboardKey(
                  char: 'G',
                  notifyKeyboard: () => pressed('G'),
                ),
                KeyboardKey(
                  char: 'H',
                  notifyKeyboard: () => pressed('H'),
                ),
                KeyboardKey(
                  char: 'J',
                  notifyKeyboard: () => pressed('J'),
                ),
                KeyboardKey(
                  char: 'K',
                  notifyKeyboard: () => pressed('K'),
                ),
                KeyboardKey(
                  char: 'L',
                  notifyKeyboard: () => pressed('L'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                EnterKey(char: 'ENTER', notifyKeyboard: () => pressed('ENTER')),
                KeyboardKey(
                  char: 'Z',
                  notifyKeyboard: () => pressed('Z'),
                ),
                KeyboardKey(
                  char: 'X',
                  notifyKeyboard: () => pressed('X'),
                ),
                KeyboardKey(
                  char: 'C',
                  notifyKeyboard: () => pressed('C'),
                ),
                KeyboardKey(
                  char: 'V',
                  notifyKeyboard: () => pressed('V'),
                ),
                KeyboardKey(
                  char: 'B',
                  notifyKeyboard: () => pressed('B'),
                ),
                KeyboardKey(
                  char: 'N',
                  notifyKeyboard: () => pressed('N'),
                ),
                KeyboardKey(
                  char: 'M',
                  notifyKeyboard: () => pressed('M'),
                ),
                DeleteKey(notifyKeyboard: () => pressed('DEL'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EnterKey extends StatelessWidget {
  const EnterKey(
      {Key? key,
      required this.char,
      required this.notifyKeyboard,
      this.aspectRatio = 0.8})
      : super(key: key);
  final String char;
  final double aspectRatio;
  final Function() notifyKeyboard;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: AspectRatio(
          aspectRatio: 1.75,
          child: TextButton(
            onPressed: notifyKeyboard,
            child: Center(
              child: Text(
                char,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DeleteKey extends StatelessWidget {
  const DeleteKey(
      {Key? key,
        required this.notifyKeyboard,
        this.aspectRatio = 0.8})
      : super(key: key);
  final double aspectRatio;
  final Function() notifyKeyboard;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: AspectRatio(
          aspectRatio: 1.8,
          child: TextButton(
            onPressed: notifyKeyboard,
            child: Center(
              child: Icon(
                Icons.backspace_outlined,
                color: Colors.white,
              )
            ),
          ),
        ),
      ),
    );
  }
}

