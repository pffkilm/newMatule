import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/colors.dart';
import 'package:ui_kit/ui_components/button.dart';
import 'package:ui_kit/ui_components/input.dart';
import 'package:ui_kit/ui_kit.dart';

class CreateProfile extends StatefulWidget{

  @override
  State<CreateProfile> createState() => Profile();
}

class Profile extends State<CreateProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _Controller = TextEditingController();
  bool _isFormFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _Controller.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isFormFilled = _emailController.text.isNotEmpty &&
          _Controller.text.isNotEmpty;
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

            Text("Создание Профиля", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),),
            SizedBox(height: 44),
            Text("Без профиля вы не сможете создавать проекты.", style: TextStyle(fontWeight: FontWeight.w400,color: AppColors.inputText ,fontSize: 14),),
            Text("В профиле будут храниться результаты проектов и ваши описания.", style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.inputText ,fontSize: 14),),
            SizedBox(height: 32),
            Input(hint: "Имя",controller: _Controller),
            SizedBox(height: 24),
            Input(hint: "Отчество",),
            SizedBox(height: 24),
            Input(hint: "Фамилия"),
            SizedBox(height: 24),
            Input(hint: "Дата рождения"),
            SizedBox(height: 24),
            SizedBox(height: 24),
            Input(hint: "Почта", controller: _emailController,),
            Spacer(),

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
              backgroundColor: _isFormFilled
                  ? AppColors.accent
                  : AppColors.input,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }

}