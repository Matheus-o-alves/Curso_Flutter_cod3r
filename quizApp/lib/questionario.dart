import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelect;
  final void Function(int) quandoresponder;
  Questionario({
    @required this.perguntas,
    @required this.perguntaSelect,
    @required this.quandoresponder,
  });

  bool get perguntaSelectReal {
    return perguntaSelect < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = (perguntaSelectReal
        ? perguntas[perguntaSelect]['respostas']
        : null) as List<Map<String, Object>>;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelect]['texto']),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => quandoresponder(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
