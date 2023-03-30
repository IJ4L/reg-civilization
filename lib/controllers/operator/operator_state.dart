// ignore_for_file: must_be_immutable

part of 'operator_cubit.dart';

abstract class OperatorState extends Equatable {
  const OperatorState();

  @override
  List<Object> get props => [];
}

class OperatorInitial extends OperatorState {}

class OperatorLoading extends OperatorState {}

class OperatorSuccses extends OperatorState {}

class OperatorLoaded extends OperatorState {
  List<wargamodel> data;

  OperatorLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class OperatorKelurahan extends OperatorState {
  List<Kelurahan> kelurahan;

  OperatorKelurahan(this.kelurahan);

  @override
  List<Object> get props => [kelurahan];
}

class OperatorFailure extends OperatorState {
  String message;

  OperatorFailure(this.message);

  @override
  List<Object> get props => [message];
}
