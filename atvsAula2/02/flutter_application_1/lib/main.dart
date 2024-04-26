import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<FoodItem> foodItems = [
    FoodItem(name: 'Pizza', price: 15.0),
    FoodItem(name: 'Hambúrguer', price: 10.0),
    FoodItem(name: 'Batata Frita', price: 5.0),
    FoodItem(name: 'Refrigerante', price: 3.0),
  ];

  List<FoodItem> selectedItems = [];

  double getTotalPrice() {
    double total = 0.0;
    selectedItems.forEach((item) {
      total += item.price;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(foodItems[index].name),
            subtitle: Text('\$${foodItems[index].price.toStringAsFixed(2)}'),
            onTap: () {
              setState(() {
                selectedItems.add(foodItems[index]);
              });
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${getTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedItems.clear();
                  });
                },
                child: Text('Limpar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItem {
  final String name;
  final double price;

  FoodItem({required this.name, required this.price});
}
