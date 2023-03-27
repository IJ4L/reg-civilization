import 'package:flutter/material.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/admin/admin_screen.dart';

import '../widget/sizedbox_widget.dart';
import '../widget/textfied_widget.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            const Center(
              child: Text(
                'Selamat Datang',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ),
            const Sizedbox(jarak: 0.015),
            Center(
              child: Text(
                'Silahkan Masukkan Username dan Password',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            const Sizedbox(jarak: 0.06),
            const TextFieldInput(txt: 'Username'),
            const TextFieldInput(txt: 'Password'),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Adminpage(),
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
