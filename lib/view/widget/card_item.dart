import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/utils/colors.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: colorGrey,
          width: MediaQuery.of(context).size.width * 0.2,
          padding: EdgeInsets.all(4.h),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Text(':'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 9.sp,
            ),
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.0,
          ),
        ),
      ],
    );
  }
}
