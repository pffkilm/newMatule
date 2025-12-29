import 'package:flutter/material.dart';
import 'package:new_matule/PasswordCreate.dart';
import 'package:new_matule/createPassword.dart';
import 'package:new_matule/createProfile.dart';
import 'package:ui_kit/ui_kit.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _helloState();
}

class _helloState extends State<Welcome> {
  String email = '';
  String password = '';


  bool get isValidEmail {
    final pattern = RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,}$');
    return pattern.hasMatch(email);
  }

  bool get hasEmailError => email.isNotEmpty && !isValidEmail;

  @override
  Widget build(BuildContext context) {
    bool login = email.isNotEmpty && password.isNotEmpty  && isValidEmail;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 105, left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              " ✋Добро пожаловать!",
              style: ui.typography.title1ExtraBold,
            ),
            SizedBox(height: 24),
            Text(
              "   Войдите, чтобы пользоваться функциями приложения",
              style: ui.typography.textRegular,
            ),
            SizedBox(height: 64),
            Center(
              child: Column(
                children: [
                  Input(
                    hint: "example@mail.ru",
                    onChanged: (value) => setState(() => email = value),
                    hasError: hasEmailError,
                    helperText: hasEmailError
                        ? 'Email должен быть в формате: name@domenname.ru'
                        : null,
                  ),
                  SizedBox(height: 14),
                  Input(
                    label: "Пароль",
                    isPassword: password.isNotEmpty,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 15),


                  if (login)
                    ui.bigButton.primary(
                      text: "Далее",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => PasswordCreate(),
                          ),
                        );
                      },
                      enabled: true,
                    )
                  else
                    ui.bigButton.primary(
                      text: "Далее",
                      onPressed: null,
                      enabled: false,
                    ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreateProfile(),
                        ),
                      );
                    },
                    child: Text(
                      "Зарегистрироваться",
                      style: ui.typography.textRegular.copyWith(
                        color: ui.colors.accent,
                      ),
                    ),
                  ),
                  SizedBox(height: 59),

                  Column(
                    children: [
                      Text(
                        "Или войдите с помощью",
                        style: ui.typography.textRegular.copyWith(
                          color: ui.colors.inputText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      ui.logo.vk( onPressed: () {},),
                      SizedBox(height: 16),
                      ui.logo.yandex( onPressed: () {},),
                    ],
                  ),
                ],

              ),
            )

          ],
        ),
      ),
    );
  }
}