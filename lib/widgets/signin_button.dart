import 'package:flutter/material.dart';
import '../core/color_manager.dart';

// ignore: must_be_immutable
class SigninButton extends StatelessWidget {
  SigninButton({super.key,required this.ontap});
  // ignore: prefer_typing_uninitialized_variables
  var size, height, width;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height / 11,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:  ColorManager.black),
        child: const Center(
            child: Text(
          "Sign in",
          style: TextStyle(color: ColorManager.white, fontSize: 23),
        )),
      ),
    );
  }
}
