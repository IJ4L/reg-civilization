import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pendataan/controllers/admin/admin_cubit.dart';
import 'package:pendataan/controllers/operator/operator_cubit.dart';
import 'package:pendataan/controllers/superadmin/superadmin_cubit.dart';
import 'package:pendataan/repository/api_service.dart';
import 'package:pendataan/view/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'controllers/login/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => SuperadminCubit(),
      ),
      BlocProvider(
        create: (context) => AdminCubit(
          ApiService(
            client: http.Client(),
          ),
        ),
      ),
      BlocProvider(
        create: (context) => OperatorCubit(
          ApiService(
            client: http.Client(),
          ),
        ),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pendataan',
          home: child,
        );
      },
      child: const LoginPage(),
    );
  }
}
