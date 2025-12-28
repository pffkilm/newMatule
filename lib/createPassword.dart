import 'package:flutter/material.dart';
import 'package:new_matule/splashScreen.dart';
import 'package:ui_kit/ui_kit.dart';

class CreatePassword extends StatefulWidget {
  @override
  State<CreatePassword> createState() => _PasswordState(); // ← ИСПРАВЬ
}

class _PasswordState extends State<CreatePassword> {
  String password1 = '';
  String password2 = '';

  bool get isStrongPassword {
    if (password1.length < 8) return false;
    if (!password1.contains(RegExp(r'[A-Z]'))) return false;
    if (!password1.contains(RegExp(r'[a-z]'))) return false;
    if (!password1.contains(RegExp(r'[0-9]'))) return false;
    if (!password1.contains(RegExp(r'[!@#$%^&*(),.?":{}|<> ]'))) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    bool passwordsMatch = password1.isNotEmpty &&
        password2.isNotEmpty &&
        password1 == password2 &&  isStrongPassword;

    return Scaffold(
      backgroundColor: ui.colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 105, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "✋ Создание пароля",
              style: ui.typography.title1ExtraBold,
            ),
            SizedBox(height: 24),
            Text(
              "Введите новый пароль",
              style: ui.typography.textRegular,
            ),
            SizedBox(height: 64),
            Column(
              children: [
                Input(
                  label: "Новый пароль",
                  isPassword: true, // ← добавь isPassword
                  onChanged: (value) {
                    setState(() {
                      password1 = value;
                    });
                  },
                  hasError: password1.isNotEmpty && !isStrongPassword,
                  helperText: password1.isNotEmpty && !isStrongPassword
                      ? 'Пароль не соответствует требованиям'
                      : null,
                ),
                SizedBox(height: 14),
                Input(
                  label: "Повторите пароль",
                  isPassword: true, // ← добавь isPassword
                  onChanged: (value) {
                    setState(() {
                      password2 = value; // ← исправь переменную
                    });
                  },
                  hasError: password2.isNotEmpty && password1 != password2,
                  helperText: password2.isNotEmpty && password1 != password2
                      ? 'Пароли не совпадают'  // ← ТЕКСТ ДЛЯ ВТОРОГО ИНПУТА
                      : null,

                ),
                SizedBox(height: 14),

                if (passwordsMatch)
                  ui.bigButton.primary(
                    text: "Сохранить",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SplashScreen(),
                        ),
                      );
                    },
                    enabled: true,
                  )
                else
                  ui.bigButton.primary(
                    text: "Сохранить",
                    onPressed: null,
                    enabled: false,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}