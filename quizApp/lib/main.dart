import 'package:flutter/material.dart';
import 'package:quizApp/result.dart';
import './questionario.dart';
import './result.dart';

void main() => runApp(Quiz());

class _QuizState extends State<Quiz> {
  // bool perguntaSelect;
  var _perguntaSelect = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua linguagem de programação preferida ?',
      'respostas': [
        {'texto': 'Dart', 'pontuacao': 10},
        {'texto': 'C++', 'pontuacao': 9},
        {'texto': 'JavaScript', 'pontuacao': 7},
        {'texto': 'Python', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual seu framework favorito?',
      'respostas': [
        {'texto': 'Flutter', 'pontuacao': 10},
        {'texto': 'React Native', 'pontuacao': 8},
        {'texto': 'Xamarin', 'pontuacao': 7},
        {'texto': 'Ionic', 'pontuacao': 6},
      ]
    },
    {
      'texto': 'Qual sua IDE preferida?',
      'respostas': [
        {'texto': 'Vscode', 'pontuacao': 10},
        {'texto': 'Vim', 'pontuacao': 15},
        {'texto': 'Android Studio', 'pontuacao': 5},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (perguntaSelectReal) {
      setState(() {
        _perguntaSelect++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelect = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get perguntaSelectReal {
    return _perguntaSelect < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // for (String textQuest in respostas) {
    //   widget.add(Resposta(textQuest, _responder));
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: perguntaSelectReal
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelect: _perguntaSelect,
                  quandoresponder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class Quiz extends StatefulWidget {
  _QuizState createState() {
    return _QuizState();
  }
}
