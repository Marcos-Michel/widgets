import 'package:app_widgets/config_app.dart';
import 'package:app_widgets/widgets/bottom_bar_nav_um.dart';
import 'package:flutter/material.dart';

class BBNUPage extends StatefulWidget {
  const BBNUPage({super.key});

  @override
  State<BBNUPage> createState() => _BBNUPageState();
}

class _BBNUPageState extends State<BBNUPage> {
  int itemAtual = 0;
  late int paginaAtual;
  late PageController controlePaginas;

  @override
  void initState() {
    super.initState();
    paginaAtual = 0;
    controlePaginas = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ConfigApp().corApp,
      appBar: AppBar(title: const Text('BottomBarNav1')),
      body: PageView(
        controller: controlePaginas,
        onPageChanged: (value) {
          setState(() {
            itemAtual = value;
          });
        },
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.green,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.brown,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.purple,
          ),
        ],
      ),
      bottomNavigationBar: BottomBarNavUm(
        itemSelecionado: itemAtual,
        aoClicar: (value) {
          setState(() {
            itemAtual = value;
          });
          controlePaginas.jumpToPage(value);
        },
        itens: [
          ItemNavBar(titulo: 'Item 1', icone: Icons.home, cor: Colors.green),
          ItemNavBar(
              titulo: 'Item 2', icone: Icons.assignment, cor: Colors.red),
          ItemNavBar(titulo: 'Item 3', icone: Icons.people, cor: Colors.blue),
          ItemNavBar(
              titulo: 'Item 4',
              icone: Icons.monetization_on,
              cor: Colors.brown),
          ItemNavBar(
              titulo: 'Item 5', icone: Icons.menu_book, cor: Colors.purple),
        ],
      ),
    );
  }
}
