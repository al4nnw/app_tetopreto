import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../../componentes/header.dart';

import '../../componentes/item_home.dart';
import '../../modelos/item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late InfiniteScrollController _controller;
  final double _itemExtent = 310;
  int activeStep = 1;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: activeStep);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          const SizedBox(height: 23),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 237.08,
                  height: 34.72,
                  decoration: const BoxDecoration(
                    image: DecorationImage(fit: BoxFit.contain, image: AssetImage("assets/logo.png")),
                  )),
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
              padding: const EdgeInsets.only(top: 1, bottom: 60),
              physics: const BouncingScrollPhysics(),
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 377),
                  child: InfiniteCarousel.builder(
                      center: true,
                      itemCount: 4,
                      controller: _controller,
                      loop: true,
                      itemExtent: _itemExtent,
                      velocityFactor: 0.5,
                      anchor: 0,
                      onIndexChanged: (index) {
                        setState(() {
                          activeStep = index;
                        });
                      },
                      itemBuilder: (context, index, realIndex) {
                        final currentOffset = _itemExtent * realIndex;
                        return AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              final diff = (_controller.offset - currentOffset);
                              const maxPadding = 23.0;
                              final _carouselRatio = _itemExtent / maxPadding;
                              return Padding(
                                  padding: EdgeInsets.only(
                                    top: (diff / _carouselRatio).abs(),
                                    bottom: (diff / _carouselRatio).abs(),
                                  ),
                                  child: child);
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (activeStep != index) {
                                      setState(() {
                                        activeStep = index;
                                        _controller.animateToItem(activeStep);
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 350,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/swiper_" + (index + 1).toString() + ".jpeg")),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            offset: const Offset(0, 5),
                                            blurRadius: 5,
                                            spreadRadius: 0,
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ));
                      }),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: DotStepper(
                    activeStep: activeStep,
                    dotCount: 4,
                    spacing: 10,
                    indicatorDecoration: IndicatorDecoration(color: Colors.grey.shade800, strokeWidth: 0),
                    dotRadius: 16,
                    shape: Shape.pipe,
                    onDotTapped: (index) {
                      setState(() {
                        activeStep = index;
                        _controller.animateToItem(index);
                      });
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                        child: ItemHome(
                      item: Item(fileName: "assets/item_1.png", preco: 90, nome: "Camiseta Melancolia"),
                    )),
                    Expanded(
                        child: ItemHome(
                      item: Item(fileName: "assets/item_0.png", preco: 100, nome: "Shorts Cargo"),
                    ))
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                        child: ItemHome(
                      item: Item(fileName: "assets/item_2.png", preco: 90, nome: "Camiseta GammaStage"),
                    )),
                    Expanded(
                        child: ItemHome(
                      item: Item(fileName: "assets/item_3.png", preco: 175, nome: "Calça Cargo"),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
