import 'package:flutter/material.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/widget/button_widget.dart';

class Addata extends StatelessWidget {
  const Addata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  'Tambah Data',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              // const TextFieldInput(txt: 'Nik'),
              // const TextFieldInput(txt: 'Nama'),
              // const TextFieldInput(txt: 'Jalan'),
              // const TextFieldInput(txt: 'Desa'),
              // const TextFieldInput(txt: 'Kecamatan'),
              // const TextFieldInput(txt: 'Kabupaten / Kota'),
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
