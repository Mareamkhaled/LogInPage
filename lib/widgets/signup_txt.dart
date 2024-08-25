import 'package:flutter/material.dart';
import '../core/color_manager.dart';

class SignupTxt extends StatelessWidget {
  const SignupTxt({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Text(
        "Sign up",
        style: TextStyle(color: ColorManager.blue, fontSize: 17),
      ),
    );
  }
}
