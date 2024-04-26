import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seja bem-vindo ao nosso aplicativo de compras!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemListScreen()),
                );
              },
              child: Text('Ver Itens'),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  final _random = Random();

  String _generateRandomItemName() {
    List<String> items = [
      'Camisa',
      'Calça',
      'Sapato',
      'Chapéu',
      'Óculos',
      'Relógio',
      'Bolsa',
      'Cinto',
      'Lenço',
      'Meia',
    ];
    return items[_random.nextInt(items.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens Disponíveis'),
      ),
      body: ListView.builder(
        itemCount: 5, // Definindo 5 itens aleatórios
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_generateRandomItemName()),
            subtitle: Text('Descrição do item ${index + 1}'),
            trailing: Text('\$${_random.nextInt(100)}'),
          );
        },
      ),
    );
  }
}
