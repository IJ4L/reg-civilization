import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pendataan/models/user_model.dart';

import '../../models/admin_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? email;
  String? idkecamatan;
  String? akses;
  String? target;

  login({required String emailAddress, required String password}) async {
    try {
      emit(LoginLoading());

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(emailAddress)
          .get();

      final role = data.data()!['role'];
      final status = data.data()!['status'];

      if (role != null && status != false) {
        switch (role) {
          case 'Admin':
            emit(Admin(
              UserModel.fromJson(data.data() as Map<String, dynamic>),
            ));
            email = UserModel.fromJson(data.data() as Map<String, dynamic>)
                .email
                .toString();
            idkecamatan =
                AdminModel.fromJson(data.data() as Map<String, dynamic>)
                    .id_kecamatan
                    .toString();
            target = AdminModel.fromJson(data.data() as Map<String, dynamic>)
                .target
                .toString();
            break;
          case 'SuperAdmin':
            emit(SuperAdmin(
              UserModel.fromJson(data.data() as Map<String, dynamic>),
            ));
            break;
          case 'Operator':
            emit(Operator(
              AdminModel.fromJson(data.data() as Map<String, dynamic>),
            ));
            akses = AdminModel.fromJson(data.data() as Map<String, dynamic>)
                .createdBy
                .toString();
            email = AdminModel.fromJson(data.data() as Map<String, dynamic>)
                .email
                .toString();
            idkecamatan =
                AdminModel.fromJson(data.data() as Map<String, dynamic>)
                    .id_kecamatan
                    .toString();
            break;
        }
      } else {
        emit(const LoginFailure('Akunmu dinonaktifkan'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const LoginFailure('User dengan email ini tidak ada'));
      } else if (e.code == 'wrong-password') {
        emit(const LoginFailure('Password salah.'));
      } else {
        emit(LoginFailure(e.message.toString()));
      }
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> getTarget(String email) async {
    final data =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    target = AdminModel.fromJson(data.data() as Map<String, dynamic>)
        .target
        .toString();
  }
}
