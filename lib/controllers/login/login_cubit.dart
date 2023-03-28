import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pendataan/models/user_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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

      if (role != null) {
        switch (role) {
          case 'Admin':
            emit(Admin(
              UserModel.fromJson(data.data() as Map<String, dynamic>),
            ));
            break;
          case 'SuperAdmin':
            emit(SuperAdmin(
              UserModel.fromJson(data.data() as Map<String, dynamic>),
            ));
            break;
          case 'Operator':
            emit(Operator(
              UserModel.fromJson(data.data() as Map<String, dynamic>),
            ));
            break;
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(const LoginFailure('Wrong password provided for that user.'));
      } else {
        emit(LoginFailure(e.message.toString()));
      }
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
