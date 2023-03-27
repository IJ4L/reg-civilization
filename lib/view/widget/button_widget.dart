import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    required this.colorButton,
    required this.colorBorder,
    required this.colorText,
  });

  final String title;
  final Color colorButton;
  final Color colorBorder;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorButton,
          border: Border.all(
            color: colorBorder,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: colorText,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
