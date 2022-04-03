import 'package:flutter/widgets.dart';

class Item {
  final String fileName;
  final double preco;
  final String nome;
  final UniqueKey key = UniqueKey();

  Item({
    required this.fileName,
    required this.preco,
    required this.nome,
  });
  String parcelamento({int parcelas = 10, int fixedAt = 0}) =>
      "ou ${parcelas}x de R\$${(preco / parcelas).toStringAsFixed(fixedAt)}";
}
