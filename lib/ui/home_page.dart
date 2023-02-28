import 'dart:math';

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

  @override
  void initState() {
    // TODO: implement initState
    changeColor();
    super.initState();
  }

  void changeColor() {
    selectColor = colors[Random().nextInt(12)];
    setState(() {});
  }

  void colorTap(Color color) {
    if (selectColor.value == color.value) {
      TodoHelper().incrementCount();
      setState(() {});
    } else {
      TodoHelper().removeCount();
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
                    setState(() {});
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
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: selectColor,
                ),
                StreamBuilder(
                  stream: TodoHelper().todoListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == 2) {
                      const Text("roshan");
                      setState(() {});
                    }
                    return Text("counter ${snapshot.data}");
                  },
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.black,
                    onPressed: () {},
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
}
