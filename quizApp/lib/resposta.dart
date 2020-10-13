import 'package:flutter/material.dart';
import './main.dart';
import './questao.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelect;
  Resposta(this.texto, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.red[400],
        child: Text(texto),
        onPressed: onSelect,
      ),
    );
  }
}
