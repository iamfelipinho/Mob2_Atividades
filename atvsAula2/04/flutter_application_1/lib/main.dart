import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculo de Média de Alunos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentGrades(),
    );
  }
}

class StudentGrades extends StatefulWidget {
  @override
  _StudentGradesState createState() => _StudentGradesState();
}

class _StudentGradesState extends State<StudentGrades> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _grade1Controller = TextEditingController();
  final TextEditingController _grade2Controller = TextEditingController();
  final TextEditingController _grade3Controller = TextEditingController();
  final TextEditingController _grade4Controller = TextEditingController();

  String _result = '';
  double _average = 0.0;

  void _calculateAverage() {
    double grade1 = double.tryParse(_grade1Controller.text) ?? 0.0;
    double grade2 = double.tryParse(_grade2Controller.text) ?? 0.0;
    double grade3 = double.tryParse(_grade3Controller.text) ?? 0.0;
    double grade4 = double.tryParse(_grade4Controller.text) ?? 0.0;

    _average = (grade1 + grade2 + grade3 + grade4) / 4;

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
        title: Text('Cálculo de Média de Alunos'),
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
            TextField(
              controller: _grade4Controller,
              decoration: InputDecoration(labelText: 'Nota 4'),
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
