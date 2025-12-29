import 'package:flutter/material.dart';
import 'package:new_matule/PasswordCreate.dart';
import 'package:new_matule/login.dart';
import 'package:new_matule/profile.dart';
import 'package:ui_kit/ui_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Переход через 5 секунд
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  Welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/SplashScreen.png",
            fit: BoxFit.cover,
          ),

          Center(
            child: Text(
              'Matule',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                height: 64 / 40,
                letterSpacing: 1.04,
                color: ui.colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}