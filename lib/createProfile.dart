import 'package:flutter/material.dart';
import 'package:new_matule/welcomePassword.dart';
import 'package:ui_kit/ui_kit.dart';

class CreateProfile extends StatefulWidget {
  @override
  State<CreateProfile> createState() => Profile();
}

class Profile extends State<CreateProfile> {
  String name = '';
  String middleName = '';
  String surname = '';
  String birthDate = '';
  String gender = '';
  String email = '';

  // Проверка email по паттерну: name@domenname.ru
  bool get isValidEmail {
    final pattern = RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,}$');
    return pattern.hasMatch(email);
  }

  bool get hasEmailError => email.isNotEmpty && !isValidEmail;


  @override
  Widget build(BuildContext context) {
    bool allFieldsFilled = name.isNotEmpty &&
        middleName.isNotEmpty &&
        surname.isNotEmpty &&
        birthDate.isNotEmpty &&
        gender.isNotEmpty &&
        email.isNotEmpty &&
        isValidEmail;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Создание Профиля",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 44),
            Text(
              "Без профиля вы не сможете создавать проекты.",
              style: ui.typography.captionRegular.copyWith(
                color: ui.colors.inputText,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 8),
            Text(
              "В профиле будут храниться результаты проектов и ваши описания.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: ui.colors.inputText,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 32),
            Input(
              hint: "Имя",
              onChanged: (value) => setState(() => name = value),
              showValidationBorder: true,

            ),
            SizedBox(height: 24),
            Input(hint: "Отчество",
              onChanged: (value) => setState(() => middleName = value),
              showValidationBorder: true,
            ),
            SizedBox(height: 24),
            Input(
              hint: "Фамилия",
              onChanged: (value) => setState(() => surname = value),
              showValidationBorder: true,
            ),
            SizedBox(height: 24),
            Input(
              hint: "Дата рождения",
              onChanged: (value) => setState(() => birthDate = value),
              showValidationBorder: true,
            ),
            SizedBox(height: 24),
            Input(hint: "Пол", onChanged: (value) => setState(() => gender = value),),
            SizedBox(height: 24),

            Input(
              hint: "example@mail.ru",
              onChanged: (value) => setState(() => email = value),
              hasError: hasEmailError,
              helperText: hasEmailError
                  ? 'Email должен быть в формате: name@domenname.ru'
                  : null,
            ),
            SizedBox(height: 24),

            Spacer(),


            if (allFieldsFilled)
              ui.bigButton.primary(
                text: "Далее",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PasswordCreate(),
                    ),
                  );
                },
                enabled: true,
              ) else
              ui.bigButton.primary(
                text: "Далее",
                onPressed: null,
                enabled: false,
              ),
          ],
        ),
      ),
    );
  }
}