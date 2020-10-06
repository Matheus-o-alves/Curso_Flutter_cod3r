import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(Quiz());

class _QuizState extends State<Quiz> {
  var _perguntaSelect = 0;
  void _responder() {
    setState(() {
      _perguntaSelect++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual sua linguagem de programação preferida ?',
        'respostas': ['Dart', 'C++', 'JavaScript', 'Python']
      },
      {
        'texto': 'Qual seu framework favorito?',
        'respostas': ['Flutter', 'React Native', 'Xamarin', 'Ionic']
      },
      {
        'texto': 'Qual sua IDE preferida?',
        'respostas': ['Vscode', 'Vim', 'Android Studio']
      },
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Questao(perguntas[_perguntaSelect]['texto']),
              Resposta('resposta 1', _responder),
              Resposta('resposta 2', _responder),
              Resposta('resposta 3', _responder),
            ],
          ),
        ));
  }
}

class Quiz extends StatefulWidget {
  _QuizState createState() {
    return _QuizState();
  }
}
