import 'package:flutter/material.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey(
      {Key? key,
      required this.char,
      required this.notifyKeyboard,
      this.aspectRatio = 0.6})
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
  final Function(String word, BuildContext context) notifyGame;

  void pressed(String char, BuildContext context) {
    notifyGame(char, context);
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
                  notifyKeyboard: () => pressed('Q', context),
                ),
                KeyboardKey(
                  char: 'W',
                  notifyKeyboard: () => pressed('W', context),
                ),
                KeyboardKey(
                  char: 'E',
                  notifyKeyboard: () => pressed('E', context),
                ),
                KeyboardKey(
                  char: 'R',
                  notifyKeyboard: () => pressed('R', context),
                ),
                KeyboardKey(
                  char: 'T',
                  notifyKeyboard: () => pressed('T', context),
                ),
                KeyboardKey(
                  char: 'Y',
                  notifyKeyboard: () => pressed('Y', context),
                ),
                KeyboardKey(
                  char: 'U',
                  notifyKeyboard: () => pressed('U', context),
                ),
                KeyboardKey(
                  char: 'I',
                  notifyKeyboard: () => pressed('I', context),
                ),
                KeyboardKey(
                  char: 'O',
                  notifyKeyboard: () => pressed('O', context),
                ),
                KeyboardKey(
                  char: 'P',
                  notifyKeyboard: () => pressed('P', context),
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
                  notifyKeyboard: () => pressed('A', context),
                ),
                KeyboardKey(
                  char: 'S',
                  notifyKeyboard: () => pressed('S', context),
                ),
                KeyboardKey(
                  char: 'D',
                  notifyKeyboard: () => pressed('D', context),
                ),
                KeyboardKey(
                  char: 'F',
                  notifyKeyboard: () => pressed('F', context),
                ),
                KeyboardKey(
                  char: 'G',
                  notifyKeyboard: () => pressed('G', context),
                ),
                KeyboardKey(
                  char: 'H',
                  notifyKeyboard: () => pressed('H', context),
                ),
                KeyboardKey(
                  char: 'J',
                  notifyKeyboard: () => pressed('J', context),
                ),
                KeyboardKey(
                  char: 'K',
                  notifyKeyboard: () => pressed('K', context),
                ),
                KeyboardKey(
                  char: 'L',
                  notifyKeyboard: () => pressed('L', context),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                EnterKey(char: 'ENTER', notifyKeyboard: () => pressed('ENTER', context)),
                KeyboardKey(
                  char: 'Z',
                  notifyKeyboard: () => pressed('Z', context),
                ),
                KeyboardKey(
                  char: 'X',
                  notifyKeyboard: () => pressed('X', context),
                ),
                KeyboardKey(
                  char: 'C',
                  notifyKeyboard: () => pressed('C', context),
                ),
                KeyboardKey(
                  char: 'V',
                  notifyKeyboard: () => pressed('V', context),
                ),
                KeyboardKey(
                  char: 'B',
                  notifyKeyboard: () => pressed('B', context),
                ),
                KeyboardKey(
                  char: 'N',
                  notifyKeyboard: () => pressed('N', context),
                ),
                KeyboardKey(
                  char: 'M',
                  notifyKeyboard: () => pressed('M', context),
                ),
                DeleteKey(notifyKeyboard: () => pressed('DEL', context))
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
      this.aspectRatio = 0.6})
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
          aspectRatio: 1.3,
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
          aspectRatio: 1.3,
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

