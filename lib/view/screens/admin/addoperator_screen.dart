import 'package:flutter/material.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/widget/button_widget.dart';
import 'package:pendataan/view/widget/textfied_widget.dart';

class Addoperator extends StatelessWidget {
  const Addoperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Tambah Operator',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const TextFieldInput(txt: 'Username'),
              const TextFieldInput(txt: 'Password'),
              const TextFieldInput(txt: 'Wilayah'),
              const TextFieldInput(txt: 'Target'),
              const Spacer(),
              const Button(
                title: 'Simpan',
                colorButton: colorBlue,
                colorBorder: Colors.white,
                colorText: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}