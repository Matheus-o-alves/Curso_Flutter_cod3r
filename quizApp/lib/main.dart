import 'package:flutter/material.dart';
import 'package:quizApp/result.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(Quiz());

class _QuizState extends State<Quiz> {
  var _perguntaSelect = 0;

  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (perguntaSelectReal) {
      setState(() {
        _perguntaSelect++;
      });
    }
  }

  bool get perguntaSelectReal {
    return _perguntaSelect < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        perguntaSelectReal ? _perguntas[_perguntaSelect]['respostas'] : null;

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
              ? Column(
                  children: <Widget>[
                    Questao(_perguntas[_perguntaSelect]['texto']),
                    ...respostas.map((t) => Resposta(t, _responder)).toList(),
                  ],
                )
              : Resultado()),
    );
  }
}

class Quiz extends StatefulWidget {
  _QuizState createState() {
    return _QuizState();
  }
}
