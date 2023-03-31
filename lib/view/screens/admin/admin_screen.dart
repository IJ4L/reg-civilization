import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/controllers/admin/admin_cubit.dart';
import 'package:pendataan/controllers/login/login_cubit.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/admin/addoperator_screen.dart';
import 'package:pendataan/view/widget/dropdown_widget.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';

import '../../../models/wilayah_model.dart';
import '../../widget/button_widget.dart';
import '../../widget/card_item.dart';
import '../../widget/profile_widget.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  void initState() {
    context.read<AdminCubit>().getAllOperator(
          context.read<LoginCubit>().email.toString(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Sizedbox(jarak: 0.01),
                  ProfileCard(
                    role: 'Admin',
                    email: context.read<LoginCubit>().email.toString(),
                  ),
                  const Sizedbox(jarak: 0.01),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80.h,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                colorBlue,
                                colorBlue.withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<AdminCubit, AdminState>(
                                builder: (context, state) {
                                  if (state is AdminGetAll) {
                                    return Text(
                                      state.admin.length.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                      textScaleFactor: 1.0,
                                    );
                                  }
                                  return Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  );
                                },
                              ),
                              Text(
                                'Jumlah Operator',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                                textScaleFactor: 1.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 36.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  colorBlue,
                                  colorBlue.withOpacity(0.2),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: BlocBuilder<AdminCubit, AdminState>(
                                builder: (context, state) {
                                  if (state is AdminGetAll) {
                                    return Text(
                                      'Data Warga : ${state.warga.length} / 100',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                      textScaleFactor: 1.0,
                                    );
                                  }
                                  return Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Addoperator(),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              height: 36.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: colorBlue),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  'Tambah Operator',
                                  style: TextStyle(
                                    color: colorBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                  ),
                                  textScaleFactor: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Sizedbox(jarak: 0.01),
                  InkWell(
                    onTap: () => context.read<AdminCubit>().logout(context),
                    borderRadius: BorderRadius.circular(4),
                    child: const Button(
                      title: 'Logout',
                      colorButton: Colors.transparent,
                      colorBorder: colorBlue,
                      colorText: colorBlue,
                    ),
                  ),
                  const Sizedbox(jarak: 0.04),
                  Row(
                    children: [
                      Text(
                        'Data Admin',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.0,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => context.read<AdminCubit>().getAllOperator(
                              context.read<LoginCubit>().email.toString(),
                            ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: colorBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.refresh,
                            color: colorBlue,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Sizedbox(jarak: 0.02),
                  Center(
                    child: BlocBuilder<AdminCubit, AdminState>(
                      builder: (context, state) {
                        if (state is AdminLoading) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        if (state is AdminGetAll) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.19,
                            child: ListView.separated(
                              itemBuilder: (context, index) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CardItem(
                                      subtitle:
                                          state.admin[index].email.toString(),
                                      title: 'Email',
                                    ),
                                    CardItem(
                                      subtitle: state.admin[index].kecamatan
                                          .toString(),
                                      title: 'Wilayah',
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (_, index) =>
                                  const SizedBox(height: 8),
                              itemCount: state.admin.length,
                            ),
                          );
                        }
                        return refresh(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Data Warga',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 1.0,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.read<AdminCubit>().getAllProvinsi();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              margin: const EdgeInsets.all(15),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 5.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 22.0.h,
                                    ),
                                    BlocBuilder<AdminCubit, AdminState>(
                                      builder: (context, state) {
                                        if (state is AdminProvinsiLoaded) {
                                          return LocationDropdown(
                                            items: state.provinsi,
                                            itemAsString: (item) => item.name,
                                            onChanged: (Provinsi? provinsi) {
                                              if (provinsi != null) {
                                                context
                                                    .read<AdminCubit>()
                                                    .getAllKabupaten(
                                                        provinsi.id);
                                              }
                                            },
                                            label: 'Provinsi',
                                          );
                                        } else if (state
                                            is AdminKabupatenLoaded) {
                                          return LocationDropdown(
                                            items: state.kabupaten,
                                            itemAsString: (item) => item.name,
                                            onChanged: (Kabupaten? kabupaten) {
                                              if (kabupaten != null) {
                                                context
                                                    .read<AdminCubit>()
                                                    .getAllKecamatam(
                                                        kabupaten.id);
                                              }
                                            },
                                            label: 'Kabupaten',
                                          );
                                        } else if (state
                                            is AdminKecamatanLoaded) {
                                          return LocationDropdown(
                                            items: state.kecamatan,
                                            itemAsString: (item) => item.name,
                                            onChanged: (Kecamatan? kecamatan) {
                                              if (kecamatan != null) {
                                                context
                                                    .read<AdminCubit>()
                                                    .getAllKelurahan(
                                                      kecamatan.id,
                                                    );
                                              }
                                            },
                                            label: 'Kecamatan',
                                          );
                                        } else if (state
                                            is AdminKelurahanLoaded) {
                                          return LocationDropdown(
                                            items: state.kelurahan,
                                            itemAsString: (item) => item.name,
                                            onChanged: (Kelurahan? kelurahan) {
                                              context
                                                  .read<AdminCubit>()
                                                  .filterwilayah(
                                                      kelurahan!.name
                                                          .toString(),
                                                      context
                                                          .read<LoginCubit>()
                                                          .email
                                                          .toString(),
                                                      '');
                                              Navigator.pop(context);
                                            },
                                            label: 'Kelurahan',
                                          );
                                        }
                                        return const Center();
                                      },
                                    ),
                                    SizedBox(
                                      height: 12.0.h,
                                    ),
                                    Text(
                                      'Jenis Kelamin',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                      textScaleFactor: 1.0,
                                    ),
                                    SizedBox(
                                      height: 12.0.h,
                                    ),
                                    const SizedBox(height: 0.01),
                                    DropdownSearch<String>(
                                      items: const ['Laki - Laki', 'Perempuan'],
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
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
                                      onChanged: (value) {
                                        context
                                            .read<AdminCubit>()
                                            .filterwilayah(
                                              '',
                                              context
                                                  .read<LoginCubit>()
                                                  .email
                                                  .toString(),
                                              value.toString(),
                                            );
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(
                                      height: 12.0.h,
                                    ),
                                    Text(
                                      'Umur',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                      textScaleFactor: 1.0,
                                    ),
                                    SizedBox(
                                      height: 12.0.h,
                                    ),
                                    Row(
                                      children: [
                                        filter('Anak - Anak', 5, 11),
                                        const SizedBox(width: 12.0),
                                        filter('Remaja', 12, 25),
                                        const SizedBox(width: 12.0),
                                        filter('Dewasa', 26, 45),
                                        const SizedBox(width: 12.0),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12.0.h,
                                    ),
                                    filter('Lansia', 46, 70),
                                  ],
                                ),
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.sort_outlined),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0.h),
                  Center(
                    child: BlocBuilder<AdminCubit, AdminState>(
                      builder: (context, state) {
                        if (state is AdminGetAll) {
                          return Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.19,
                                child: ListView.separated(
                                  itemBuilder: (context, index) => Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CardItem(
                                          subtitle: state.warga[index].nama
                                              .toString(),
                                          title: 'Nama',
                                        ),
                                        CardItem(
                                          subtitle:
                                              state.warga[index].nik.toString(),
                                          title: 'Nik',
                                        ),
                                      ],
                                    ),
                                  ),
                                  separatorBuilder: (_, index) =>
                                      const SizedBox(height: 8),
                                  itemCount: state.warga.length,
                                ),
                              ),
                            ],
                          );
                        }
                        return refresh(context);
                      },
                    ),
                  ),
                  const Sizedbox(jarak: 0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector refresh(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AdminCubit>().getAllOperator(
              context.read<LoginCubit>().email.toString(),
            );
        Navigator.pop(context);
      },
      child: SizedBox(
        height: 140.h,
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/nodata.png",
                fit: BoxFit.fill,
                width: 40.h,
                height: 40.h,
                color: colorBlue,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'klik untuk merefresh',
                style: TextStyle(fontSize: 10.sp),
                textScaleFactor: 1.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector filter(String title, int start, int end) {
    return GestureDetector(
      onTap: () {
        context.read<AdminCubit>().filterUsia(
              context.read<LoginCubit>().email.toString(),
              start,
              end,
            );
        Navigator.pop(context);
      },
      child: Container(
        height: 30.h,
        width: 90.w,
        decoration: const BoxDecoration(
          color: colorBlue,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
