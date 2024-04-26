import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Média',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/portuguese': (context) => GradeScreen(subject: 'Português'),
        '/math': (context) => GradeScreen(subject: 'Matemática'),
        '/history': (context) => GradeScreen(subject: 'História'),
        '/science': (context) => GradeScreen(subject: 'Ciências'),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Média'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/portuguese');
              },
              child: Text('Português'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/math');
              },
              child: Text('Matemática'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: Text('História'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/science');
              },
              child: Text('Ciências'),
            ),
          ],
        ),
      ),
    );
  }
}

class GradeScreen extends StatefulWidget {
  final String subject;

  GradeScreen({required this.subject});

  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _grade1Controller = TextEditingController();
  final TextEditingController _grade2Controller = TextEditingController();
  final TextEditingController _grade3Controller = TextEditingController();

  double _average = 0.0;
  String _result = '';

  void _calculateAverage() {
    double grade1 = double.tryParse(_grade1Controller.text) ?? 0.0;
    double grade2 = double.tryParse(_grade2Controller.text) ?? 0.0;
    double grade3 = double.tryParse(_grade3Controller.text) ?? 0.0;

    _average = (grade1 + grade2 + grade3) / 3;

    if (_average >= 6.0) {
      _result = 'Aprovado';
    } else {
      _result = 'Reprovado';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
            TextField(
              controller: _grade1Controller,
              decoration: InputDecoration(labelText: 'Nota 1'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _grade2Controller,
              decoration: InputDecoration(labelText: 'Nota 2'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _grade3Controller,
              decoration: InputDecoration(labelText: 'Nota 3'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateAverage();
              },
              child: Text('Calcular Média'),
            ),
            SizedBox(height: 20),
            Text('Média: $_average'),
            Text('Resultado: $_result', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
