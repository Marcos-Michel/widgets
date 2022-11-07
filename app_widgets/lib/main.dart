import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidgets());
}

class AppWidgets extends StatelessWidget {
  const AppWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Expanded(
                flex: 2,
                child: Center(
                    child: Text('Lista de Widgets',
                        style: TextStyle(fontSize: 24)))),
            Expanded(
              flex: 10,
              child: ListView(
                shrinkWrap: true,
                children: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
