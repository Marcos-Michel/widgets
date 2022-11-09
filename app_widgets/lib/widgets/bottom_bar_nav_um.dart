import 'package:flutter/material.dart';

class ItemNavBar {
  String titulo;
  Color cor;
  IconData icone;

  ItemNavBar({required this.titulo, required this.icone, required this.cor});
}

class BottomBarNavUm extends StatelessWidget {
  const BottomBarNavUm(
      {super.key,
      required this.itemSelecionado,
      this.aoClicar,
      required this.itens});

  final ValueChanged<int>? aoClicar;

  final int itemSelecionado;

  final List<ItemNavBar> itens;

  _construirItem(ItemNavBar item, bool selecionado) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            //size: selecionado ? 30 : 20,
            item.icone,
            color: !selecionado ? Colors.black26 : null,
            shadows:
                selecionado ? [Shadow(color: item.cor, blurRadius: 1.5)] : null,
          ),
          //CONTEINER PARA CRIAR CIRCULO DE MARCAÇÃO DE ITEM ATIVO
          Container(
            width: 8,
            height: 8,
            decoration: selecionado
                ? BoxDecoration(
                    color: item.cor,
                    borderRadius: const BorderRadius.all(Radius.circular(50)))
                : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 56,
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: itens.map((item) {
            // PEGAR INDEX DO ITEM ATUAL PARA COMPARAÇÃO SE SELEÇÃO
            var indexItemAtual = itens.indexOf(item);

            return GestureDetector(
              onTap: () {
                //ATIVA A FUNCAO DE ALTERAÇÃO DE VALOR DO INDEX SELECIONADO
                aoClicar?.call(indexItemAtual);
              },
              //CONSTRUÇÃO DO ITEM
              //PASSAGEM DE DADOS PARA FUNÇÃO CONSTRUIR ITEM
              //COMPARAÇÃO PARA SABER SE O ITEM ATUAL É O SELECIONADO
              child: _construirItem(item, indexItemAtual == itemSelecionado),
            );
          }).toList(),
        ),
      ),
    );
  }
}
