import 'package:app_widgets/config_app.dart';
import 'package:app_widgets/pages/bottom_bar_nav_um_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidgets());
}

class AppWidgets extends StatelessWidget {
  const AppWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: ConfigApp().corApp),
      debugShowCheckedModeBanner: false,
      home: const PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  _construirItem(String titulo, Function() funcao) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: funcao,
        child: Text(titulo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          children: [
            const Expanded(
                flex: 1,
                child: Center(
                    child: Text('Lista de Widgets',
                        style: TextStyle(fontSize: 24)))),
            Expanded(
              flex: 9,
              child: ListView(
                shrinkWrap: true,
                children: [
                  _construirItem('BottomBarNav 1', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const BBNUPage())));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
