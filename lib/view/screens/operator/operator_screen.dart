import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/controllers/admin/admin_cubit.dart';
import 'package:pendataan/controllers/operator/operator_cubit.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/operator/addata_screen.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';
import '../../../controllers/login/login_cubit.dart';
import '../../widget/card_item.dart';

class Operatorpage extends StatefulWidget {
  const Operatorpage({super.key});

  @override
  State<Operatorpage> createState() => _OperatorpageState();
}

class _OperatorpageState extends State<Operatorpage> {
  @override
  void initState() {
    context.read<OperatorCubit>().getAllDatawarga(
          context.read<LoginCubit>().email.toString(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: colorBlue,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(context.read<LoginCubit>().email.toString()),
              accountEmail: const Text("Operator"),
              decoration: const BoxDecoration(
                color: colorBlue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Operatorpage()),
                (route) => false,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text("Tambah Data"),
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Addata()),
                (route) => false,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text("Logout"),
              onTap: () => context.read<AdminCubit>().logout(context),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: colorBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Data Warga : ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.read<OperatorCubit>().getAllDatawarga(
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
            const Sizedbox(jarak: 0.01),
            BlocBuilder<OperatorCubit, OperatorState>(
              builder: (context, state) {
                if (state is OperatorLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is OperatorLoaded) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => Container(
                        height: MediaQuery.of(context).size.height * 0.3,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardItem(
                              subtitle: state.data[index].nik.toString(),
                              title: 'Nik',
                            ),
                            CardItem(
                              subtitle: state.data[index].nama.toString(),
                              title: 'Nama',
                            ),
                            CardItem(
                              subtitle: state.data[index].umur.toString(),
                              title: 'Umur',
                            ),
                            CardItem(
                              subtitle:
                                  state.data[index].jenisKelamin.toString(),
                              title: 'Jenis Kelamin',
                            ),
                            CardItem(
                              subtitle: state.data[index].jalan.toString(),
                              title: 'Jalan',
                            ),
                            CardItem(
                              subtitle: state.data[index].kelurahan.toString(),
                              title: 'Kelurahan',
                            ),
                            CardItem(
                              subtitle: state.data[index].kecamatan.toString(),
                              title: 'Kecamatan',
                            ),
                            CardItem(
                              subtitle: state.data[index].kabupaten.toString(),
                              title: 'Kabupaten',
                            ),
                            CardItem(
                              subtitle: state.data[index].provinsi.toString(),
                              title: 'Provinsi',
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (_, index) => const SizedBox(height: 8),
                      itemCount: state.data.length,
                    ),
                  );
                }
                return const Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
