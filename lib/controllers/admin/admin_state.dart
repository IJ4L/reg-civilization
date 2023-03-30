// ignore_for_file: must_be_immutable

part of 'admin_cubit.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminProvinsiLoaded extends AdminState {
  List<Provinsi> provinsi;

  AdminProvinsiLoaded(this.provinsi);

  @override
  List<Object> get props => [provinsi];
}

class AdminKabupatenLoaded extends AdminState {
  List<Kabupaten> kabupaten;

  AdminKabupatenLoaded(this.kabupaten);

  @override
  List<Object> get props => [kabupaten];
}

class AdminKecamatanLoaded extends AdminState {
  List<Kecamatan> kecamatan;

  AdminKecamatanLoaded(this.kecamatan);

  @override
  List<Object> get props => [kecamatan];
}

class AdminKelurahanLoaded extends AdminState {
  List<Kelurahan> kelurahan;

  AdminKelurahanLoaded(this.kelurahan);

  @override
  List<Object> get props => [kelurahan];
}

class AdminGetAll extends AdminState {
  List<AdminModel> admin;
  List<wargamodel> warga;

  AdminGetAll(this.admin, this.warga);

  @override
  List<Object> get props => [admin, warga];
}

class AdminFailure extends AdminState {
  String message;

  AdminFailure(this.message);

  @override
  List<Object> get props => [message];
}
