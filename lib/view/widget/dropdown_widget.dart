import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class LocationDropdown<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) itemAsString;
  final void Function(T?) onChanged;
  final String label;

  const LocationDropdown({
    super.key,
    required this.items,
    required this.itemAsString,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10.sp,
          ),
          textScaleFactor: 1.0,
        ),
        SizedBox(
          height: 12.0.h,
        ),
        DropdownSearch<T>(
          items: items,
          itemAsString: itemAsString,
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.all(25),
              fillColor: colorGrey,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
