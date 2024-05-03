import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Consultoria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SM Consultoria'),
      ),
      body: ListView(
        children: [
          ServiceCard(
            title: 'Projeto',
            imagePath: 'assets/project_image.png',
            value: 'R\$ 1000',
          ),
          ServiceCard(
            title: 'Consultoria',
            imagePath: 'assets/consulting_image.png',
            value: 'R\$ 500',
          ),
          ServiceCard(
            title: 'Elaboração de Laudo',
            imagePath: 'assets/report_image.png',
            value: 'R\$ 800',
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String value;

  const ServiceCard({
    required this.title,
    required this.imagePath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 60,
          height: 60,
        ),
        title: Text(title),
        subtitle: Text('Valor: $value'),
        onTap: () {
          // Implementação para quando o card for pressionado
          // Você pode adicionar a navegação para uma nova tela aqui
        },
      ),
    );
  }
}
