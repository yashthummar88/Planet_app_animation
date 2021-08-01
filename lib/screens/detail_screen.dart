import 'dart:math';

import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const route = "/detail_screen";
  final String? image;
  final String? title;
  final String? location;

  final String? speed;

  DetailScreen({this.image, this.title, this.location, this.speed});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    child: Container(
                      height: 220,
                      width: 370,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff434273),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 5),
                                spreadRadius: -4,
                                blurRadius: 10),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.title?.toUpperCase() ?? "0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Milkyway Galaxy",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Image.asset(
                                    "assets/images/location.png",
                                    height: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    widget.location ?? "0",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/arrow.png",
                                    height: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    widget.speed ?? "0",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: double.infinity,
                                      color: Colors.blue,
                                      child: Text(
                                        "Welcome to ${widget.title?.toUpperCase() ?? "0"}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 27,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      child: Image.asset(
                                        widget.image ?? "0",
                                        height: 100,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: Text(
                                        "Distance to Sun",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "241.44 million km",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: Text(
                                        "Distance to Earth",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "250.83 million km",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Transform.rotate(
                        angle: rotateAnimation.value,
                        child: Image.asset(
                          widget.image ?? "0",
                          height: 140,
                        ),
                      ),
                    ),
                    top: MediaQuery.of(context).size.height * 0.12,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
              child: Text(
                "OVERVIEW",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the Red Planet.[16][17] The latter refers to the effect of the iron oxide prevalent on Mars's surface, which gives it a reddish appearance distinctive among the astronomical bodies visible to the naked eye.",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
              Text(
                "BACK",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
