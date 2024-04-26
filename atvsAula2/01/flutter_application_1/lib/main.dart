import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInfoScreen(),
    );
  }
}

class UserInfoScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var userInfo = UserInfo(
                  name: _nameController.text,
                  age: _ageController.text,
                  address: _addressController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                );
                exibirInformacoes(userInfo);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void exibirInformacoes(UserInfo userInfo) {
    print("\nInformações do usuário:");
    print("Nome: ${userInfo.name}");
    print("Idade: ${userInfo.age}");
    print("Endereço: ${userInfo.address}");
    print("Email: ${userInfo.email}");
    print("Telefone: ${userInfo.phone}");
  }
}

class UserInfo {
  final String name;
  final String age;
  final String address;
  final String email;
  final String phone;

  UserInfo({required this.name, required this.age, required this.address, required this.email, required this.phone});
}
