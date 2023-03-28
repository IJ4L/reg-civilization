import 'package:flutter/material.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/login_screen.dart';
import 'package:pendataan/view/screens/operator/addata_screen.dart';
import 'package:pendataan/view/widget/profile_widget.dart';

import '../../widget/button_widget.dart';
import '../../widget/card_item.dart';

class Operatorpage extends StatelessWidget {
  const Operatorpage({super.key});

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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const ProfileCard(role: 'Operator'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: colorGrey,
                )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Data',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '50 / 100',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
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
                          subtitle: '7307022405030001',
                          title: 'Nik',
                        ),
                        CardItem(
                          subtitle: 'Nursyamsu rijal usman',
                          title: 'Nama',
                        ),
                        CardItem(
                          subtitle: 'Jl. Samata Gowa Sulawesi',
                          title: 'Jalan',
                        ),
                        CardItem(
                          subtitle: 'Bikeru',
                          title: 'Desa',
                        ),
                        CardItem(
                          subtitle: 'Sangeseri',
                          title: 'Kecamatan',
                        ),
                        CardItem(
                          subtitle: 'Sinjai',
                          title: 'Kota',
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (_, index) => const SizedBox(height: 8),
                  itemCount: 4,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Addata()),
                ),
                child: const Button(
                  title: '+Tambah Data',
                  colorButton: colorBlue,
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
