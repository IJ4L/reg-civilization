import 'package:flutter/material.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/login_screen.dart';
import 'package:pendataan/view/screens/superadmin/addadmin_screen.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';

import '../../widget/button_widget.dart';
import '../../widget/card_item.dart';
import '../../widget/profile_widget.dart';

class Superadmin extends StatelessWidget {
  const Superadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileCard(role: 'Superadmin'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data Admin',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Sizedbox(jarak: 0.02),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorGrey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardItem(
                              subtitle: 'Ijal124',
                              title: 'Username',
                            ),
                            CardItem(
                              subtitle: '12345678',
                              title: 'Password',
                            ),
                            CardItem(
                              subtitle: 'Aktif',
                              title: 'Status',
                            ),
                          ],
                        ),
                      ),
                      const ButtonMaker(),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.height * 0.06,
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: colorBlue,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (_, index) => const SizedBox(height: 8),
                  itemCount: 4,
                ),
              ),
              const Sizedbox(jarak: 0.02),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Addadmin()),
                ),
                child: const Button(
                  title: '+Tambah Admin',
                  colorButton: colorBlue,
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                ),
              ),
              const Sizedbox(jarak: 0.02),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ),
                child: const Button(
                  title: 'Logout',
                  colorButton: Colors.white,
                  colorBorder: colorBlue,
                  colorText: colorBlue,
                ),
              ),
              const Sizedbox(jarak: 0.02),
            ],
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
