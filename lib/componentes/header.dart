import 'package:flutter/material.dart';

import 'item_header.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 14, top: 14, left: 18),
          child: Row(
            children: const [
              ItemHeader(name: "CAMISETAS"),
              ItemHeader(name: "CASACOS"),
              ItemHeader(name: "MOLETOM"),
              ItemHeader(name: "CALÇAS"),
              ItemHeader(name: "SHORTS"),
              ItemHeader(name: "ACESSÓRIOS"),
              ItemHeader(name: "AJUDA"),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
