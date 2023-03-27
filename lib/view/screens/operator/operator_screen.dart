import 'package:flutter/material.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/login_screen.dart';
import 'package:pendataan/view/screens/operator/addata_screen.dart';

import '../../widget/button_widget.dart';
import '../../widget/card_item.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                height: MediaQuery.of(context).size.height * 0.14,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.065,
                      height: MediaQuery.of(context).size.height * 0.065,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.08 / 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.08 / 2,
                        ),
                        // child: Image.network(
                        //   "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                        //   width: MediaQuery.of(context).size.height * 0.065,
                        //   height: MediaQuery.of(context).size.height * 0.065,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nursyamsu Rijal Usman',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.008,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                            color: colorBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Operator',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Row(
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
                  MaterialPageRoute(builder: (context) => const Loginpage()),
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
