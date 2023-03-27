import 'package:flutter/material.dart';

class Sizedbox extends StatelessWidget {
  const Sizedbox({
    super.key,
    required this.jarak,
  });

  final double jarak;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * jarak,
    );
  }
}
