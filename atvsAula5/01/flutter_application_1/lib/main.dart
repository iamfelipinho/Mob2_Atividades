import 'package:flutter/material.dart';

void main() {
  runApp(SMConsultoriaApp());
}

class Service {
  final String name;
  final String image;
  final double value;

  Service({required this.name, required this.image, required this.value});
}

class SMConsultoriaApp extends StatelessWidget {
  final List<Service> services = [
    Service(name: 'Projeto', image: 'https://sbruzziarquitetura.com.br/novo/wp-content/uploads/2021/06/projeto-arquitetura-residencial-quando-iniciar-projeto.jpg', value: 1000),
    Service(name: 'Consultoria', image: 'https://www.idebrasil.com.br/blog/wp-content/uploads/2020/01/blog-conheca-4-tipos-de-consultoria-para-empresas-850x441.jpg', value: 500),
    Service(name: 'Elaboração de Laudo', image: 'https://gestaomaior.com.br/wp-content/uploads/2019/09/Laudos-1002x501.jpg', value: 800),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Consultoria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ServicesScreen(services: services),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  final List<Service> services;

  ServicesScreen({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços da SM Consultoria'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(service: services[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: services[index].image.startsWith('http') ? 
                  Image.network(services[index].image) : 
                  Image.asset(services[index].image),
                title: Text(services[index].name),
                subtitle: Text('Valor: R\$ ${services[index].value.toStringAsFixed(2)}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ServiceDetailScreen extends StatelessWidget {
  final Service service;

  ServiceDetailScreen({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            service.image.startsWith('http') ? 
              Image.network(service.image) : 
              Image.asset(service.image),
            SizedBox(height: 20),
            Text('Valor: R\$ ${service.value.toStringAsFixed(2)}'),
            // Aqui você pode adicionar mais detalhes sobre o serviço, se necessário
          ],
        ),
      ),
    );
  }
}
