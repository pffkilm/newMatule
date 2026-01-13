import 'package:flutter/material.dart';
import 'package:new_matule/Search.dart';
import 'package:ui_kit/ui_kit.dart';
import 'profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
     Home(),
    Container(color: Colors.white, child: Center(child: Text('Каталог'))),
    Container(color: Colors.white, child: Center(child: Text('Проекты'))),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ui.tabBar.create(
        initialIndex: _selectedIndex,
        onIndexChanged: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}