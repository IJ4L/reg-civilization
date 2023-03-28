import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

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
        height: 45.h,
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
              fontWeight: FontWeight.bold,
              color: colorText,
              fontSize: 12.sp,
            ),
            textScaleFactor: 1.0,
          ),
        ),
      ),
    );
  }
}

class ButtonMaker extends StatelessWidget {
  const ButtonMaker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.height * 0.06,
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.delete_outline_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Container buttonMaker(String image, String title) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(4.h),
      border: Border.all(
        color: colorBlue,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 20.h,
          height: 20.h,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 12.w),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.h,
            color: colorBlue,
          ),
        )
      ],
    ),
  );
}
