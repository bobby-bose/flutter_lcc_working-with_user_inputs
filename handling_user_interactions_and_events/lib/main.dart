import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Interactions and Events',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayText = '';

  void _handleButtonPress() {
    setState(() {
      _displayText = 'Button Pressed!';
    });
  }

  void _handleLongPress() {
    setState(() {
      _displayText = 'Long Pressed!';
    });
  }

  void _handleTap() {
    setState(() {
      _displayText = 'Tapped!';
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _displayText = 'Double Tapped!';
    });
  }

  void _handleSwipeLeft() {
    setState(() {
      _displayText = 'Swiped Left!';
    });
  }

  void _handleSwipeRight() {
    setState(() {
      _displayText = 'Swiped Right!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Interactions and Events')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_displayText, style: TextStyle(fontSize: 20)),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Button'),
              onPressed: _handleButtonPress,
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onLongPress: _handleLongPress,
              onTap: _handleTap,
              onDoubleTap: _handleDoubleTap,
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  _handleSwipeLeft();
                } else if (details.primaryVelocity! > 0) {
                  _handleSwipeRight();
                }
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
