import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  'Admin',
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
    );
  }
}
