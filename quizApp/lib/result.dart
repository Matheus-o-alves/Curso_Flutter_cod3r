import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);
  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!!';
    } else if (pontuacao < 12) {
      return 'Você mandou bem!!';
    } else if (pontuacao < 16) {
      return 'Incrivel';
    } else {
      return 'Nivel Jedí !!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            child: Text(
              fraseResultado,
              style: TextStyle(
                fontSize: 35,
                color: Colors.red,
              ),
            ),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              backgroundColor: Colors.red[200],
            ),
          ),
          textColor: Colors.red,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
