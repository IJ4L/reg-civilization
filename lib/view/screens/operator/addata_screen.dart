import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/controllers/admin/admin_cubit.dart';
import 'package:pendataan/controllers/login/login_cubit.dart';
import 'package:pendataan/controllers/operator/operator_cubit.dart';
import 'package:pendataan/models/wilayah_model.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/operator/operator_screen.dart';
import 'package:pendataan/view/widget/button_widget.dart';

import '../../widget/sizedbox_widget.dart';
import '../../widget/textfied_widget.dart';

class Addata extends StatefulWidget {
  const Addata({super.key});

  @override
  State<Addata> createState() => _AddataState();
}

class _AddataState extends State<Addata> {
  @override
  void initState() {
    context
        .read<OperatorCubit>()
        .getAllKelurahan(context.read<LoginCubit>().idkecamatan.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nik = TextEditingController();
    TextEditingController nama = TextEditingController();
    TextEditingController jalan = TextEditingController();
    TextEditingController umur = TextEditingController();

    String? jenisKelamin;
    String? keluarhan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Warga'),
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
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Addata(),
                  ),
                  (route) => false,
                );
              },
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
            TextFieldInput(txt: 'Nik', controller: nik),
            TextFieldInput(txt: 'Nama', controller: nama),
            TextFieldInput(txt: 'Jalan', controller: jalan),
            const Sizedbox(jarak: 0.02),
            Text(
              'Kelurahan',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
              ),
              textScaleFactor: 1.0,
            ),
            const Sizedbox(jarak: 0.01),
            BlocBuilder<OperatorCubit, OperatorState>(
              builder: (context, state) {
                if (state is OperatorKelurahan) {
                  return DropdownSearch<Kelurahan>(
                    items: state.kelurahan,
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
                    onChanged: (value) {
                      keluarhan = value!.name;
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
            TextFieldInput(txt: 'Umur', controller: umur),
            const Sizedbox(jarak: 0.02),
            Text(
              'Jenis kelamin',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
              ),
              textScaleFactor: 1.0,
            ),
            const Sizedbox(jarak: 0.01),
            DropdownSearch<String>(
              items: const [
                'Laki - Laki',
                'Perempuan',
              ],
              selectedItem: 'Laki - Laki',
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
              onChanged: (value) {
                jenisKelamin = value;
              },
            ),
            const Spacer(),
            BlocConsumer<OperatorCubit, OperatorState>(
              listener: (context, state) {
                if (state is OperatorSuccses) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Operatorpage(),
                      ),
                      (route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil Ditambahkan'),
                    ),
                  );
                  context.read<OperatorCubit>().getAllDatawarga(
                        context.read<LoginCubit>().email.toString(),
                      );
                }
                if (state is OperatorFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message.toString()),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is Operator) {
                      return GestureDetector(
                        onTap: () {
                          context.read<OperatorCubit>().addDataWarga(
                                nik.text,
                                nama.text,
                                umur.text,
                                jenisKelamin ?? '',
                                jalan.text,
                                keluarhan ?? '',
                                state.user.kecamatan.toString(),
                                state.user.kabupaten.toString(),
                                state.user.provinsi.toString(),
                                context.read<LoginCubit>().akses.toString(),
                                context.read<LoginCubit>().email.toString(),
                              );
                          context.read<OperatorCubit>().getAllKelurahan(
                                context
                                    .read<LoginCubit>()
                                    .idkecamatan
                                    .toString(),
                              );
                        },
                        child: const Button(
                          title: 'Simpan',
                          colorButton: colorBlue,
                          colorBorder: Colors.white,
                          colorText: Colors.white,
                        ),
                      );
                    }
                    return Container();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
