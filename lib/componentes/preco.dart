import 'package:flutter/material.dart';

import '../estilos/cores.dart';

class Preco extends StatelessWidget {
  final double preco;
  final int fixedAt;
  const Preco({Key? key, required this.preco, this.fixedAt = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "R\$",
          style: TextStyle(fontSize: 18, color: Colors.grey.shade500, fontWeight: FontWeight.bold)),
      TextSpan(
          text: preco.toStringAsFixed(fixedAt),
          style: const TextStyle(fontSize: 18, color: preto, fontWeight: FontWeight.bold))
    ]));
  }
}
