import 'package:flutter/material.dart';

void main() {
  runApp(MachineListApp());
}

class Machine {
  final String name;
  final double usageTime; // Tempo de utilização em horas
  final double consumption; // Consumo em watts

  Machine({required this.name, required this.usageTime, required this.consumption});
}

class MachineListApp extends StatelessWidget {
  final List<Machine> machines = [
    Machine(name: 'Torno', usageTime: 4.5, consumption: 1500),
    Machine(name: 'Fresa', usageTime: 3, consumption: 1200),
    Machine(name: 'Furadeira', usageTime: 2.5, consumption: 800),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MachineListPage(machines: machines),
    );
  }
}

class MachineListPage extends StatelessWidget {
  final List<Machine> machines;

  MachineListPage({required this.machines});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machines'),
      ),
      body: ListView.builder(
        itemCount: machines.length,
        itemBuilder: (context, index) {
          return MachineListItem(machine: machines[index]);
        },
      ),
    );
  }
}

class MachineListItem extends StatelessWidget {
  final Machine machine;

  MachineListItem({required this.machine});

  @override
  Widget build(BuildContext context) {
    double totalConsumption = machine.usageTime * machine.consumption / 1000; // Calcula o consumo em kWh

    return ListTile(
      title: Text(machine.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tempo de Utilização: ${machine.usageTime.toStringAsFixed(2)} horas'),
          Text('Consumo: ${machine.consumption.toString()} watts'),
          Text('Consumo Total de Energia: ${totalConsumption.toStringAsFixed(2)} kWh'),
        ],
      ),
    );
  }
}
