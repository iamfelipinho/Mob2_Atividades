import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isPressed = false;

  void _toggleButton() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleButton,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 200,
            height: 200,
            color: _isPressed ? Colors.green : Colors.red,
            alignment: Alignment.center,
            child: Text(
              'Pressione',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
