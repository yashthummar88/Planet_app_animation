import 'dart:math';

import 'package:animator_planet_app/screens/detail_screen.dart';
import 'package:animator_planet_app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'screens/home_scrren.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Color(0xff3E3963),
      ),
      routes: {
        "/": (context) => MyApp(),
        DetailScreen.route: (context) => DetailScreen(),
      },
    ),
  );
}
