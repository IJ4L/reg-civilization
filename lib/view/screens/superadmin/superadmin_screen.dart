import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/controllers/superadmin/superadmin_cubit.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/superadmin/addadmin_screen.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';

import '../../widget/button_widget.dart';
import '../../widget/card_item.dart';
import '../../widget/profile_widget.dart';

class Superadmin extends StatefulWidget {
  const Superadmin({super.key});

  @override
  State<Superadmin> createState() => _SuperadminState();
}

class _SuperadminState extends State<Superadmin> {
  @override
  void initState() {
    super.initState();
    SuperadminCubit.get(context).getAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperadminCubit, SuperadminState>(
      builder: (context, state) {
        if (state is SuperadminLoaded) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileCard(role: 'Superadmin'),
                    const Sizedbox(jarak: 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Addadmin(),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(4.h),
                            child: buttonMaker(
                              'assets/images/addAdmin.png',
                              'Tambah Admin',
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        InkWell(
                          onTap: () =>
                              SuperadminCubit.get(context).logout(context),
                          borderRadius: BorderRadius.circular(4.h),
                          child: buttonMaker(
                            'assets/images/logout.png',
                            'Logout',
                          ),
                        ),
                      ],
                    ),
                    const Sizedbox(jarak: 0.01),
                    SizedBox(
                      height: 45.h,
                      child: buttonMaker(
                        'assets/images/all.png',
                        'Admin',
                      ),
                    ),
                    const Sizedbox(jarak: 0.02),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.09,
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
                                    subtitle: '${state.admin[index].email}',
                                    title: 'Email',
                                  ),
                                  CardItem(
                                    subtitle: state.admin[index].status == true
                                        ? 'Aktif'
                                        : 'Nonaktif',
                                    title: 'Status',
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                margin: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                  color: colorBlue.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(
                                    4.h,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.edit,
                                    color: colorBlue,
                                    size: 16.h,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        separatorBuilder: (_, index) => SizedBox(height: 8.h),
                        itemCount: state.admin.length,
                      ),
                    ),
                    const Sizedbox(jarak: 0.02),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
