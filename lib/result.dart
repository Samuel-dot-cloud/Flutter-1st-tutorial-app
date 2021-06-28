import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler);

  String get resultPhase {
    var resultText;
    if (resultScore <= 20) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 35) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 40) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(children: <Widget>[
        Text(
        resultPhase,
        style: const TextStyle(fontSize: 36, 
        fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
      TextButton(
        child: 
        const Text(
          'Restart Quiz', 
          style: TextStyle(color: Colors.white),
        ), 
         style:  ButtonStyle(
           backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
           ),
      onPressed: resetHandler,
      )
      ],
      ) 
    );
  }
}
