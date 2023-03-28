class UserModel {
  String? username;
  String? role;
  String? email;
  bool? status;

  UserModel({this.username, this.role, this.email, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    role = json['role'];
    email = json['email'];
    status = json['status'];
  }
}
