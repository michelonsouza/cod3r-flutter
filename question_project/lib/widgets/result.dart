import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onRestart;

  Result({
    Key key,
    @required this.score,
    @required this.onRestart,
  }) : super(key: key);

  String get resultText {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante';
    }

    return 'Nível Jedi!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultText,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        FlatButton(
          onPressed: onRestart,
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          textColor: Colors.blue,
        ),
      ],
    );
  }
}
