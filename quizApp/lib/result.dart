import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  String result = 'Parabens!';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Parabéns!',
          style: TextStyle(
            fontSize: 35,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
