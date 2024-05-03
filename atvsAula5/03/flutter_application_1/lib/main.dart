import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoggedIn = false;

  void _login() {
    // Simplesmente verifica se o login e senha são "admin" e "password".
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'password') {
      setState(() {
        _isLoggedIn = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de login'),
          content: Text('Nome de usuário ou senha incorretos.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return EnergyCalculatorPage();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Nome de usuário'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class EnergyCalculatorPage extends StatefulWidget {
  @override
  _EnergyCalculatorPageState createState() => _EnergyCalculatorPageState();
}

class _EnergyCalculatorPageState extends State<EnergyCalculatorPage> {
  final TextEditingController _consumptionController =
      TextEditingController();
  final double _pricePerKWh = 0.65;
  double _totalPrice = 0.0;

  void _calculateTotalPrice() {
    double consumption = double.tryParse(_consumptionController.text) ?? 0.0;
    setState(() {
      _totalPrice = consumption * _pricePerKWh;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _consumptionController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Consumo (KWh)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTotalPrice,
              child: Text('Calcular Valor'),
            ),
            SizedBox(height: 20),
            Text(
              'Valor da Conta: R\$ ${_totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
