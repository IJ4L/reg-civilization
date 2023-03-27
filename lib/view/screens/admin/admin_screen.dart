import 'package:flutter/material.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/admin/addoperator_screen.dart';
import 'package:pendataan/view/screens/login_screen.dart';
import 'package:pendataan/view/screens/operator/addata_screen.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';

import '../../widget/button_widget.dart';
import '../../widget/card_item.dart';
import '../../widget/profile_widget.dart';

class Adminpage extends StatelessWidget {
  const Adminpage({super.key});

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
              const ProfileCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'All Data',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Sizedbox(jarak: 0.01),
                      Text(
                        '55 / 100',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            child: const Column(
                              children: [],
                            ),
                          ),
                        );
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: colorBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.sort_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Sizedbox(jarak: 0.02),
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
              const Sizedbox(jarak: 0.02),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Addoperator()),
                ),
                child: const Button(
                  title: '+Tambah Operator',
                  colorButton: colorBlue,
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                ),
              ),
              const Sizedbox(jarak: 0.02),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginpage()),
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
