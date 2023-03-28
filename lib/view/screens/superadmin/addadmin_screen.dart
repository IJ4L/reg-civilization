import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pendataan/controllers/superadmin/superadmin_cubit.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/superadmin/superadmin_screen.dart';
import 'package:pendataan/view/widget/button_widget.dart';
import 'package:pendataan/view/widget/sizedbox_widget.dart';

import '../../widget/textfied_widget.dart';

class Addadmin extends StatelessWidget {
  const Addadmin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return BlocConsumer<SuperadminCubit, SuperadminState>(
      listener: (context, state) {
        if (state is SuperadminLoading) {
          (ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loading'),
            ),
          ));
        }
        if (state is SuperadminAddSuccses) {
          (ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Succses'),
            ),
          ));
        }
        if (state is SuperadminFailure) {
          (ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.messsage),
            ),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Tambah Admin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextFieldInput(txt: 'Email', controller: email),
                  TextFieldInput(txt: 'Password', controller: password),
                  const Sizedbox(jarak: 0.02),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<SuperadminCubit>(context).addAdmin(
                        emailAddress: email.text,
                        password: password.text,
                        context: context,
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Superadmin()),
                        (route) => false,
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
      },
    );
  }
}
