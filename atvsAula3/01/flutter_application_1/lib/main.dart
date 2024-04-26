import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases do Dia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do Dia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha uma opção para ver a frase do dia:'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhraseScreen(phrase: 'Enquanto a cor da pele for mais importante do que o brilho dos olhos, havera guerra')),
                );
              },
              child: Text('Tela 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhraseScreen(phrase: 'Viva um pouco que você vera, a vida é mais bela do que você jamais imaginara')),
                );
              },
              child: Text('Tela 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhraseScreen(phrase: 'Sua determinação é sua maior força.')),
                );
              },
              child: Text('Tela 3'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhraseScreen(phrase: 'A jornada mais longa começa com um único passo.')),
                );
              },
              child: Text('Tela 4'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhraseScreen(phrase: 'A persistência leva ao sucesso.')),
                );
              },
              child: Text('Tela 5'),
            ),
          ],
        ),
      ),
    );
  }
}

class PhraseScreen extends StatelessWidget {
  final String phrase;

  PhraseScreen({required this.phrase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frase do Dia'),
      ),
      body: Center(
        child: Text(
          phrase,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

