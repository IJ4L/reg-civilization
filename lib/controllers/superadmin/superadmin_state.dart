// ignore_for_file: must_be_immutable

part of 'superadmin_cubit.dart';

abstract class SuperadminState extends Equatable {
  const SuperadminState();

  @override
  List<Object> get props => [];
}

class SuperadminInitial extends SuperadminState {}

class SuperadminLoading extends SuperadminState {}

class SuperadminAddSuccses extends SuperadminState {}

class SuperadminLoaded extends SuperadminState {
  List<UserModel> admin;

  SuperadminLoaded(this.admin);

  @override
  List<Object> get props => [admin];
}

class SuperadminFailure extends SuperadminState {
  String messsage;

  SuperadminFailure(this.messsage);

  @override
  List<Object> get props => [messsage];
}
