// ignore_for_file: non_constant_identifier_names

class AdminModel {
  String? createdBy;
  String? email;
  String? kabupaten;
  String? kecamatan;
  String? password;
  String? provinsi;
  String? role;
  bool? status;
  String? id_kecamatan;

  AdminModel({
    this.email,
    this.role,
    this.kabupaten,
    this.status,
    this.createdBy,
    this.kecamatan,
    this.password,
    this.provinsi,
    this.id_kecamatan,
  });

  AdminModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    kabupaten = json['kabupaten'];
    status = json['status'];
    createdBy = json['createdBy'];
    kecamatan = json['kecamatan'];
    password = json['password'];
    provinsi = json['provinsi'];
    id_kecamatan = json['id_kecamatan'];
  }
}
