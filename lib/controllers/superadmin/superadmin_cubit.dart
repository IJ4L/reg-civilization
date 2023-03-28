// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pendataan/models/user_model.dart';
import 'package:pendataan/repository/firebase.dart';
import 'package:pendataan/view/screens/login_screen.dart';
import 'package:pendataan/view/screens/superadmin/superadmin_screen.dart';

part 'superadmin_state.dart';

class SuperadminCubit extends Cubit<SuperadminState> {
  SuperadminCubit() : super(SuperadminInitial());

  static SuperadminCubit get(context) => BlocProvider.of(context);
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> getAdmin() async {
    try {
      List<UserModel> user = await getAllAdmin();

      emit(SuperadminLoaded(user));
    } catch (error) {
      emit(SuperadminFailure(error.toString()));
    }
  }

  Future<void> addAdmin(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      await createAdmin(email: emailAddress, password: password);
      await getAdmin();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Superadmin()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SuperadminFailure("Password terlalu pendek"));
      } else if (e.code == 'email-already-in-use') {
        emit(SuperadminFailure('Email ini sudah digunakan'));
      } else {
        emit(SuperadminFailure(e.message.toString()));
      }
    } catch (error) {
      emit(SuperadminFailure(error.toString()));
    }
  }

  Future<void> logout(BuildContext context) async {
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }
}
