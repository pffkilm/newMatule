import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_kit/ui_components/Menu.dart';

class Katalog extends StatefulWidget {
  Katalog();

  @override
  State<Katalog> createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: 72, left: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      SimpleSearchBar(width: 256),
                      SizedBox(width: 38),
                      Image.asset("assets/images/profile.png"),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 48,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Menu(text: 'Все', isActive: true),
                        const SizedBox(width: 16),
                        Menu(text: 'Женщинам'),
                        const SizedBox(width: 16),
                        Menu(text: 'Мужчинам'),
                        const SizedBox(width: 16),
                        Menu(text: 'Детям'),
                        const SizedBox(width: 16),
                        Menu(text: 'Аксессуары'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ui.productCard.card(
                    title: 'Рубашка Воскресенье для машинного\nвязания',
                    subtitle: 'Мужская одежда',
                    price: '300',
                    button: ui.smallButton.primary(
                      text: "Добавить",
                      onPressed: (){},
                      enabled: true,
                    ),
                  ),
                  SizedBox(height: 10),

                  ui.productCard.card(
                    title: 'Рубашка Воскресенье для машинного\nвязания',
                    subtitle: 'Мужская одежда',
                    price: '300',
                    button: ui.smallButton.delete(
                      text: "Убрать",
                      onPressed: (){},
                    ),
                  ),
                ]
            )
        )

    );
  }
}