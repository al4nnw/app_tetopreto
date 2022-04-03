import 'package:flutter/material.dart';
import 'package:tetopreto/componentes/preco.dart';
import 'package:tetopreto/telas/produto/detalhes_produto.dart';

import '../modelos/item.dart';

class ItemHome extends StatelessWidget {
  final Item item;
  const ItemHome({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => DetalhesProduto(item: item),
            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      },
      child: Container(
        color: Colors.transparent, // tornar o quadrado inteiro do item clicavel
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: item.key,
              child: Container(
                  height: 151,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(item.fileName), fit: BoxFit.contain))),
            ),
            const SizedBox(height: 19),
            Text(item.nome,
                style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.bold)),
            Preco(
              preco: item.preco,
              fixedAt: 0,
            ),
            Text(item.parcelamento(),
                style: TextStyle(
                    fontFamily: "KeepCalm",
                    fontSize: 13,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal))
          ],
        ),
      ),
    );
  }
}
