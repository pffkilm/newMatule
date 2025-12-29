import 'package:flutter/material.dart';
import 'package:new_matule/Search.dart';
import 'package:new_matule/createPassword.dart';
import 'package:new_matule/profile.dart';
import 'package:new_matule/splashScreen.dart';
import 'package:ui_kit/ui_kit.dart';

class PasswordCreate extends StatefulWidget {
  const PasswordCreate ({super.key});

  @override
  State<PasswordCreate> createState() => _PasswordState();
}

class _PasswordState extends State<PasswordCreate> {
  String password = '';
  final int passwordLength = 4;
  String lastPressedDigit = '';

  void _addDigit(String digit) {
    if (password.length < passwordLength) {
      setState(() {
        password += digit;
        lastPressedDigit = digit;
      });

      // ДОБАВЛЕНО: проверяем после добавления цифры
      if (password.length == passwordLength) {
        // Пароль полностью введен - переходим на следующую страницу
        _goToNextPage();
      }
    }
  }

  void _deleteDigit() {
    if (password.isNotEmpty) {
      setState(() {
        password = password.substring(0, password.length - 1);
        lastPressedDigit = password.isNotEmpty ? password[password.length - 1] : '';
      });
    }
  }

  // ДОБАВЛЕНО: функция перехода
  void _goToNextPage() {
    // Замените NextPage() на вашу следующую страницу
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Search()), // ← ИЗМЕНИТЕ НА ВАШУ СТРАНИЦУ
      );
    });
  }

  bool _isActive(String digit) {
    return lastPressedDigit == digit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
              'Создайте пароль',
              style: ui.typography.title1ExtraBold.copyWith(
                  color: Colors.black,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'Для защиты ваших персональных данных',
              style: ui.typography.textMedium.copyWith(
                color: Color(0xFF939396),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(passwordLength, (index) {
                bool isFilled = index < password.length;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isFilled ? ui.colors.accent : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ui.colors.accent,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 80),

            Column(
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigitButton('1'),
                const SizedBox(width: 24),
                _buildDigitButton('2'),
                const SizedBox(width: 24),
                _buildDigitButton('3'),
              ],
            ),
            const SizedBox(height: 24),

            // Второй ряд: 4, 5, 6
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigitButton('4'),
                const SizedBox(width: 24),
                _buildDigitButton('5'),
                const SizedBox(width: 24),
                _buildDigitButton('6'),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigitButton('7'),
                const SizedBox(width: 24),
                _buildDigitButton('8'),
                const SizedBox(width: 24),
                _buildDigitButton('9'),
              ],
            ),
            const SizedBox(height: 24),

            Row(
                mainAxisAlignment:MainAxisAlignment.center,
              children: [
                const SizedBox(width: 80),
                const SizedBox(width: 24),
                _buildDigitButton('0'),
                const SizedBox(width: 24),
                _buildDeleteButton(), // Кнопка удаления
              ],
            ),
              ],
            ),
              ],
            ),
        ),
    );
  }

  Widget _buildDigitButton(String digit) {
    bool isActive = _isActive(digit);

    return GestureDetector(
      onTap: () => _addDigit(digit),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isActive ? ui.colors.accent :Color(0xFFF5F5F9),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            digit,
            style: ui.typography.title1Semibold.copyWith(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: _deleteDigit,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.backspace,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}