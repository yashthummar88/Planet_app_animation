import 'dart:math';

import 'package:animator_planet_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation rotateAnimation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    rotateAnimation = Tween<double>(begin: 0, end: pi * 2).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text("Galaxy Planets"),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.search)],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 20),
                planetUDF(
                    rotateAnimation: rotateAnimation,
                    title: "Mars",
                    subTitle: "Milkyway Galaxy",
                    location: "54.6m km",
                    image: "assets/images/mars.png",
                    speed: "3.711m/s\u00B2"),
                SizedBox(height: 20),
                planetUDF(
                    rotateAnimation: rotateAnimation,
                    title: "Neptune",
                    subTitle: "Milkyway Galaxy",
                    location: "2.7b km",
                    image: "assets/images/neptune.png",
                    speed: "11.5m/s\u00B2"),
                SizedBox(height: 20),
                planetUDF(
                    rotateAnimation: rotateAnimation,
                    title: "Moon",
                    subTitle: "Milkyway Galaxy",
                    location: "384.4k km",
                    image: "assets/images/moon.png",
                    speed: "1.62m/s\u00B2"),
                SizedBox(height: 20),
                planetUDF(
                    rotateAnimation: rotateAnimation,
                    title: "Earth",
                    subTitle: "Milkyway Galaxy",
                    location: "384.4k km",
                    image: "assets/images/earth.png",
                    speed: "1.62m/s\u00B2"),
                SizedBox(height: 20),
                planetUDF(
                    rotateAnimation: rotateAnimation,
                    title: "Mercury",
                    subTitle: "Milkyway Galaxy",
                    location: "384.4k km",
                    image: "assets/images/mercury.png",
                    speed: "1.62m/s\u00B2"),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
