import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';

import '../../utils/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.role,
    required this.email,
  });

  final String role;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/user.png",
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
                textScaleFactor: 1.0,
              ),
              const Sizedbox(jarak: 0.0065),
              Text(
                email,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 24.h,
            width: 70.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorBlue,
                  colorBlue.withOpacity(0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(6.h),
            ),
            child: Center(
              child: Text(
                role,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 10.sp,
                  color: Colors.white,
                ),
                textScaleFactor: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
