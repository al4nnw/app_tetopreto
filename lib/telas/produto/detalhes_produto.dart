import 'package:flutter/material.dart';
import 'package:tetopreto/componentes/preco.dart';

import '../../componentes/header.dart';
import '../../estilos/cores.dart';
import '../../modelos/item.dart';

const TextStyle tabelaTamanhos =
    TextStyle(fontFamily: "FuturaBook", fontSize: 20, color: preto, fontWeight: FontWeight.normal);

class DetalhesProduto extends StatelessWidget {
  final Item item;
  const DetalhesProduto({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        const SizedBox(height: 23),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                  width: 237.08,
                  height: 34.72,
                  decoration: const BoxDecoration(
                    image: DecorationImage(fit: BoxFit.contain, image: AssetImage("assets/logo.png")),
                  )),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withAlpha(130),
                  offset: const Offset(1, 2),
                  spreadRadius: 1,
                  blurRadius: 5),
            ]),
            child: const Header()),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, bottom: 60),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Hero(
                  tag: item.key,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.contain, image: AssetImage(item.fileName)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text(item.nome,
                    style: const TextStyle(
                        fontFamily: "KeepCalm", fontSize: 25, color: preto, fontWeight: FontWeight.normal)),
                Preco(
                  preco: item.preco,
                  fixedAt: 0,
                ),
                const SizedBox(height: 5),
                Text(item.parcelamento(),
                    style: TextStyle(
                        fontFamily: "KeepCalm",
                        fontSize: 15,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.normal)),
              ]),
              const SizedBox(height: 25),
              const OpcoesTamanho(),
              const SizedBox(height: 25),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(preto),
                            elevation: MaterialStateProperty.all(5),
                            overlayColor: MaterialStateProperty.all(branco.withOpacity(0.1))),
                        onPressed: () {},
                        child: const Text("Comprar",
                            style: TextStyle(
                                fontFamily: "FuturaHeavy",
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.normal))),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 31, top: 35),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Medidas",
                          style: TextStyle(
                              fontFamily: "FuturaHeavy",
                              fontSize: 20,
                              color: preto,
                              fontWeight: FontWeight.normal)),
                      Text("Largura e Altura",
                          style: TextStyle(
                              fontFamily: "FuturaHeavy",
                              fontSize: 20,
                              color: preto,
                              fontWeight: FontWeight.normal)),
                      SizedBox(height: 10),
                      _LinhaTabelaTamanhos("PP:", 52, 64),
                      _LinhaTabelaTamanhos("P:", 56, 67.5),
                      _LinhaTabelaTamanhos("M:", 59, 70.5),
                      _LinhaTabelaTamanhos("G:", 64, 74),
                      _LinhaTabelaTamanhos("GG:", 69, 80.5),
                      SizedBox(height: 10),
                      Text("Detalhes",
                          style: TextStyle(
                              fontFamily: "FuturaHeavy",
                              fontSize: 20,
                              color: preto,
                              fontWeight: FontWeight.normal)),
                      Text("""Camiseta TetoPreto x GammaStage
100% algodão orgânico e sustentável
Selo BCI
Corte Oversized
Com codigo Qr para a musica do
GammaStage Verão2022""", style: tabelaTamanhos)
                    ]),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class _LinhaTabelaTamanhos extends StatelessWidget {
  final String nome;
  final num largura;
  final num altura;
  const _LinhaTabelaTamanhos(
    this.nome,
    this.largura,
    this.altura, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Row(
          children: [
            Expanded(flex: 10, child: Text(nome, style: tabelaTamanhos)),
            Expanded(
                flex: 20,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(largura.toString(), style: tabelaTamanhos))),
            Expanded(
                flex: 20,
                child: Align(
                    alignment: Alignment.centerRight, child: Text(altura.toString(), style: tabelaTamanhos))),
          ],
        ));
  }
}

class OpcoesTamanho extends StatefulWidget {
  const OpcoesTamanho({
    Key? key,
  }) : super(key: key);

  @override
  State<OpcoesTamanho> createState() => _OpcoesTamanhoState();
}

class _OpcoesTamanhoState extends State<OpcoesTamanho> {
  late int selected;

  List<String> sizes = ["PP", "P", "M", "G", "GG"];

  @override
  void initState() {
    super.initState();
    selected = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (String size in sizes)
            GestureDetector(
                onTap: () {
                  setState(() {
                    selected = sizes.indexOf(size);
                  });
                },
                child: Tamanho(content: size, selected: selected == sizes.indexOf(size)))
        ],
      ),
    );
  }
}

class Tamanho extends StatelessWidget {
  final String content;
  final bool selected;
  const Tamanho({Key? key, required this.content, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 41,
        width: 41,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          color: selected ? Colors.black : null,
          boxShadow: selected
              ? null
              : [
                  const BoxShadow(
                    color: Colors.black,
                  ),
                  const BoxShadow(
                    color: cinzaClaro,
                    spreadRadius: 12.5,
                    blurRadius: 12.0,
                  ),
                ],
        ),
        child: Center(
            child: Text(content,
                style: TextStyle(
                    fontSize: 19,
                    color: selected ? Colors.white : cinzaEscuro,
                    fontWeight: FontWeight.normal,
                    fontFamily: "KeepCalm"))));
  }
}
