// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/utils/colors.dart';

import 'sizedbox_widget.dart';

class TextFieldInput extends StatelessWidget {
  TextFieldInput({
    super.key,
    required this.txt,
    required this.controller,
  });

  final String txt;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Sizedbox(jarak: 0.02),
        Text(
          txt,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const Sizedbox(jarak: 0.01),
        TextField(
          controller: controller,
          cursorRadius: Radius.circular(8),
          decoration: InputDecoration(
            fillColor: colorGrey,
            filled: true,
            contentPadding: EdgeInsets.all(16.h),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
