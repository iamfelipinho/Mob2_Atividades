import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/basketball': (context) => BasketballScreen(),
        '/football': (context) => FootballScreen(),
        '/nfl': (context) => NFLScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basketball');
              },
              child: Text('Basquete'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/football');
              },
              child: Text('Futebol'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/nfl');
              },
              child: Text('NFL'),
            ),
          ],
        ),
      ),
    );
  }
}

class BasketballScreen extends StatelessWidget {
  final List<String> basketballPlayers = [
    'Michael Jordan',
    'LeBron James',
    'Kobe Bryant',
    'Stephen Curry',
    'Kevin Durant',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basquete'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jogadores de Basquete'),
            for (var player in basketballPlayers) Text(player),
          ],
        ),
      ),
    );
  }
}

class FootballScreen extends StatelessWidget {
  final List<String> footballPlayers = [
    'Lionel Messi',
    'Cristiano Ronaldo',
    'Neymar Jr',
    'Kylian Mbappé',
    'Robert Lewandowski',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futebol'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jogadores de Futebol'),
            for (var player in footballPlayers) Text(player),
          ],
        ),
      ),
    );
  }
}

class NFLScreen extends StatelessWidget {
  final List<String> nflPlayers = [
    'Tom Brady',
    'Patrick Mahomes',
    'Aaron Rodgers',
    'Russell Wilson',
    'Drew Brees',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jogadores da NFL'),
            for (var player in nflPlayers) Text(player),
          ],
        ),
      ),
    );
  }
}
