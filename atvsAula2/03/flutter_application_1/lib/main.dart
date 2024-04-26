import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informações de Jogadores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayerList(),
    );
  }
}

class PlayerList extends StatelessWidget {
  final List<Player> players = [
    Player(name: 'Neymar', age: 30, goals: 439),
    Player(name: 'Cristiano Ronaldo', age: 37, goals: 885),
    Player(name: 'Ronaldo Fenômeno', age: 45, goals: 414),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações de Jogadores'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(players[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Idade: ${players[index].age} anos'),
                Text('Gols Marcados: ${players[index].goals}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Player {
  final String name;
  final int age;
  final int goals;

  Player({required this.name, required this.age, required this.goals});
}
