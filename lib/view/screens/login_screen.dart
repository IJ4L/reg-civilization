import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pendataan/controllers/login/login_cubit.dart';
import 'package:pendataan/utils/colors.dart';
import 'package:pendataan/view/screens/admin/admin_screen.dart';
import 'package:pendataan/view/screens/operator/operator_screen.dart';
import 'package:pendataan/view/screens/superadmin/superadmin_screen.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                const Center(
                  child: Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Silahkan Masukkan Username dan Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextFieldInput(txt: 'Username', controller: emailController),
                TextFieldInput(txt: 'Password', controller: passwordController),
                const Spacer(),
                GestureDetector(
                  onTap: () => BlocProvider.of<LoginCubit>(context).login(
                    emailAddress: emailController.text,
                    password: passwordController.text,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
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
