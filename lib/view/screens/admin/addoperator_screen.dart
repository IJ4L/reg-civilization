import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/controllers/login/login_cubit.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/widget/button_widget.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';

import '../../../controllers/admin/admin_cubit.dart';
import '../../../models/wilayah_model.dart';
import '../../widget/textfied_widget.dart';

class Addoperator extends StatefulWidget {
  const Addoperator({super.key});

  @override
  State<Addoperator> createState() => _AddoperatorState();
}

class _AddoperatorState extends State<Addoperator> {
  @override
  void initState() {
    context.read<AdminCubit>().getAllProvinsi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    String? provinsiUp;
    String? kabupatenUp;
    String? kecamatanUp;

    String? idKecamatan;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  color: colorBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Tambah Operator',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.0,
                ),
              ),
              const Sizedbox(jarak: 0.02),
              TextFieldInput(txt: 'Email', controller: email),
              TextFieldInput(txt: 'Password', controller: password),
              const Sizedbox(jarak: 0.02),
              BlocBuilder<AdminCubit, AdminState>(
                builder: (context, state) {
                  if (state is AdminProvinsiLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Provinsi',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                          textScaleFactor: 1.0,
                        ),
                        const Sizedbox(jarak: 0.01),
                        DropdownSearch<Provinsi>(
                          items: state.provinsi,
                          itemAsString: (item) => item.name,
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
                          onChanged: (Provinsi? provinsi) {
                            if (provinsi != null) {
                              provinsiUp = provinsi.name;
                              context
                                  .read<AdminCubit>()
                                  .getAllKabupaten(provinsi.id);
                            }
                          },
                        ),
                      ],
                    );
                  } else if (state is AdminKabupatenLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kabupaten',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                          textScaleFactor: 1.0,
                        ),
                        const Sizedbox(jarak: 0.01),
                        DropdownSearch<Kabupaten>(
                          items: state.kabupaten,
                          itemAsString: (item) => item.name,
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
                          onChanged: (Kabupaten? kabupaten) {
                            kabupatenUp = kabupaten!.name;
                            context
                                .read<AdminCubit>()
                                .getAllKecamatam(kabupaten.id);
                          },
                        ),
                      ],
                    );
                  } else if (state is AdminKecamatanLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kecamatan',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                          textScaleFactor: 1.0,
                        ),
                        const Sizedbox(jarak: 0.01),
                        DropdownSearch<Kecamatan>(
                          items: state.kecamatan,
                          itemAsString: (item) => item.name,
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
                          onChanged: (Kecamatan? kecamatan) {
                            kecamatanUp = kecamatan!.name;
                            idKecamatan = kecamatan.id;
                          },
                        ),
                      ],
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const Sizedbox(jarak: 0.04),
              GestureDetector(
                onTap: () {
                  context.read<AdminCubit>().createOperator(
                        email.text,
                        password.text,
                        provinsiUp ?? '',
                        kabupatenUp ?? '',
                        kecamatanUp ?? '',
                        context.read<LoginCubit>().email.toString(),
                        idKecamatan ?? '',
                        context,
                      );
                },
                child: const Button(
                  title: 'Simpan',
                  colorButton: colorBlue,
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
