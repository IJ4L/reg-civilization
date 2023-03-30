class UserModel {
  String? password;
  String? role;
  String? email;
  bool? status;

  UserModel({this.password, this.role, this.email, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    role = json['role'];
    email = json['email'];
    status = json['status'];
  }
}
