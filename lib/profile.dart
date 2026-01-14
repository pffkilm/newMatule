import 'package:flutter/material.dart';
import 'package:new_matule/login.dart';
import 'package:ui_kit/ui_kit.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.only(left: 20,top: 76),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Эдуард",
            style: ui.typography.caption2Bold.copyWith(
            fontSize: 24)
            ),
            SizedBox(height:8),
            Text("afersfsr@dsfsr.ru",
              style: ui.typography.textRegular.copyWith(
                fontSize: 16,
            color: ui.colors.inputText,
            ),),
            SizedBox(height: 44),
            Text("📋 Мои заказы",style: ui.typography.title3Semibold),
            SizedBox(height: 44),
            Row(
              children: [
              Text("⚙️ Уведомления",style: ui.typography.title3Semibold),
                SizedBox(width: 112),
                Toggle(isActive: true,)
           ],
          ),
            SizedBox(height: 176),

            Center(
              child: Column(
                children: [
                  Text("Политика конфиденциальности",
                    style: ui.typography.headlineMedium.copyWith(
                      fontSize: 15,
                      color: ui.colors.inputText,
                  ),),
                  SizedBox(height: 24),
                  Text("Пользовательское соглашение",
                    style: ui.typography.headlineMedium.copyWith(
                      fontSize: 15,
                      color: ui.colors.inputText,
                    ),),
                  SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Welcome(),
                        ),
                      );
                    },
                    child: Text(
                      "Выход",
                      style: ui.typography.headlineMedium.copyWith(
                        fontSize: 15,
                        color: ui.colors.error,
                      ),
                    ),
                  ),
                ],
              ),
            )
         ],
       ),
      )
    );
  }
  
}