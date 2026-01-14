import 'package:flutter/material.dart';
import 'package:new_matule/katalog.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:new_matule/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Katalog(),
    );
  }
}
