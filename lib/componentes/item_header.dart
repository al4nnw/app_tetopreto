import 'package:flutter/material.dart';

class ItemHeader extends StatelessWidget {
  final String name;
  const ItemHeader({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Text(name,
          style: const TextStyle(
              fontFamily: "FuturaHeavy", fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600)),
    );
  }
}
