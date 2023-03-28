import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/controllers/login/login_cubit.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/admin/admin_screen.dart';
import 'package:pendataan/view/screens/operator/operator_screen.dart';
import 'package:pendataan/view/screens/superadmin/superadmin_screen.dart';
import 'package:pendataan/view/widget/button_widget.dart';

import '../widget/textfied_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logging in...'),
            ),
          );
        }
        if (state is Admin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Adminpage(),
            ),
          );
        }
        if (state is Operator) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Operatorpage(),
            ),
          );
        }
        if (state is SuperAdmin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Superadmin(),
            ),
          );
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120.h),
                Center(
                  child: Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(height: 4.h),
                Center(
                  child: Text(
                    'Silahkan Masukkan Email dan Password anda',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(height: 24.h),
                TextFieldInput(txt: 'Email', controller: emailController),
                TextFieldInput(txt: 'Password', controller: passwordController),
                const Spacer(),
                GestureDetector(
                  onTap: () => BlocProvider.of<LoginCubit>(context).login(
                    emailAddress: emailController.text,
                    password: passwordController.text,
                  ),
                  child: const Button(
                    title: 'Masuk',
                    colorButton: colorBlue,
                    colorBorder: Colors.white,
                    colorText: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
