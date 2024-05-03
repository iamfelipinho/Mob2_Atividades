import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyConverterPage(),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double _reais = 0.0;
  double _convertedValue = 0.0;
  String? _selectedCurrency = 'Dólar';

  void _convertCurrency() {
    setState(() {
      if (_selectedCurrency == 'Dólar') {
        _convertedValue = _reais * 0.19; // Taxa de conversão do Real para Dólar
      } else if (_selectedCurrency == 'Euro') {
        _convertedValue = _reais * 0.16; // Taxa de conversão do Real para Euro
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite o valor em Reais'),
              onChanged: (value) {
                setState(() {
                  _reais = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text('Selecione a moeda de destino:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio(
                  value: 'Dólar',
                  groupValue: _selectedCurrency,
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency = value as String?;
                    });
                  },
                ),
                Text('Dólar'),
                Radio(
                  value: 'Euro',
                  groupValue: _selectedCurrency,
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency = value as String?;
                    });
                  },
                ),
                Text('Euro'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Converter'),
            ),
            SizedBox(height: 20.0),
            Text('Valor convertido: $_convertedValue ${_selectedCurrency == 'Dólar' ? 'Dólares' : 'Euros'}'),
          ],
        ),
      ),
    );
  }
}
