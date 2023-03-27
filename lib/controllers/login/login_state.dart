// ignore_for_file: must_be_immutable

part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class Admin extends LoginState {
  UserModel user;

  Admin(this.user);

  @override
  List<Object> get props => [user];
}

class SuperAdmin extends LoginState {
  UserModel user;

  SuperAdmin(this.user);

  @override
  List<Object> get props => [user];
}

class Operator extends LoginState {
  UserModel user;

  Operator(this.user);

  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
