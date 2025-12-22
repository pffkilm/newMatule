import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_matule/splashScreen.dart';
import 'package:ui_kit/images.dart';
import 'package:ui_kit/ui_components/button.dart';
import 'package:ui_kit/ui_components/input.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_kit/colors.dart';
import 'package:ui_kit/typography.dart';
import 'createProfile.dart';

class Hello extends StatefulWidget{

  @override
  State<Hello> createState() => _helloState();
}

class _helloState extends State<Hello> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isFormFilled = false;


  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isFormFilled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  AppColors.white,
        appBar: AppBar(backgroundColor: AppColors.white),
        body: Padding(padding: EdgeInsets.all(20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   AppImages.delete(size: 10),
                  Text(
                    "Добро пожаловать!",
                    style: AppTypography.title1ExtraBold,
                  ),
                ],
              ),

              SizedBox(height: 24,),
              Text(
                "Войдите, чтобы пользоваться функциями приложения",
                style: AppTypography.textRegular,
              ),
              SizedBox(height: 64),
              Input(
                hint: "example@mail.com",
                label: "Вход по E-mail",
                controller: _emailController,
              ),
              SizedBox(height: 14,),
              Input(
                controller: _passwordController,
                label: "Пароль",
                isPassword: true,
              ),
              SizedBox(height: 14,),
              MyButton(
                text: "Далее",
                onPressed: () {
                  if (_isFormFilled) {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => CreateProfile(),
                      ),
                    );
                  }
                },
                minHeight: 56,
                minWidth: 335,
                backgroundColor: _isFormFilled
                    ? AppColors.accent
                    : AppColors.inputIcon,
                textColor: AppColors.white,
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  "Зарегистрироваться",
                  style: AppTypography.textRegular.copyWith(
                    color: AppColors.accent,
                  ),
                ),
              ),
              SizedBox(height: 59,),
              Column(
                children: [
                  Text(
                    "Или войдите с помощью",
                    style: AppTypography.textRegular.copyWith(
                      color: AppColors.inputText,
                    ),
                  ),
                  SizedBox(height: 16),
                  // login(
                  //   imagePath:AppImages.vk,
                  //   text:"c VK" ,
                  // ),
                  // SizedBox(height: 16),
                  // login(
                  //   imagePath: AppImages.yandex,
                  //   text:"c Yandex" ,
                  // ),
                ],
              )
            ],
          ),)

    );
  }

}