import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:state_management_stream_demo/helper/color_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List colors = [
    Colors.blue,
    Colors.amber,
    Colors.pink,
    Colors.red,
    Colors.black,
    Colors.yellowAccent,
    Colors.brown,
    Colors.tealAccent,
    Colors.purpleAccent,
    Colors.teal,
    Colors.black12,
    Colors.blueGrey,
  ];
  int counter = 0;
  late Color selectColor;
  late ConfettiController controller;

  @override
  void initState() {
    // TODO: implement initState
    changeColor();
    controller = ConfettiController(
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  void changeColor() {
    selectColor = colors[Random().nextInt(12)];
  }

  void colorTap(Color color) {
    if (selectColor.value == color.value) {
      TodoHelper().incrementCount();
      setState(() {});
    } else {
      TodoHelper().removeCount();
      changeColor();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                Color color = colors[Random().nextInt(12)];
                return InkWell(
                  onTap: () {
                    colorTap(color);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: color,
                  ),
                );
              },
            ),
          ),
          animationButton(),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: selectColor,
                ),
                StreamBuilder(
                  stream: TodoHelper().todoListStream,
                  builder: (context, snapshot) {
                    if (snapshot.data == 10) {
                      controller.play();
                      changeColor();
                    }
                    return Text("counter ${snapshot.data}");
                  },
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      TodoHelper().removeCount();
                      changeColor();
                      setState(() {});
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget animationButton() {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        blastDirectionality: BlastDirectionality.explosive,
        confettiController: controller,
        particleDrag: 0.05,
        emissionFrequency: 0.05,
        numberOfParticles: 25,
        gravity: 0.05,
        shouldLoop: false,
        colors: const [
          Colors.green,
          Colors.red,
          Colors.yellow,
          Colors.blue,
        ],
      ),
    );
  }
}
