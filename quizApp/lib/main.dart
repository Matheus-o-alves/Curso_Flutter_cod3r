import 'package:flutter/material.dart';

main() => runApp(Quiz());

class QuizState extends State<Quiz> {
  var perguntaSelect = 0;
  void responder() {
    setState(() {
      perguntaSelect++;
    });
    print(perguntaSelect);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual sua linguagem de programação preferida ?',
      'Qual seu framework favorito?',
      'React Native ou Flutter?',
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Text(perguntas.elementAt(perguntaSelect)),
              RaisedButton(
                child: Text('Resposta 1'),
                onPressed: responder,
              ),
              RaisedButton(
                child: Text('Resposta 2'),
                onPressed: responder,
              ),
              RaisedButton(
                child: Text('Resposta 3'),
                onPressed: responder,
              )
            ],
          ),
        ));
  }
}

class Quiz extends StatefulWidget {
  QuizState createState() {
    return QuizState();
  }
}
