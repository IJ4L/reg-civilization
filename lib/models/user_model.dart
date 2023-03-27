class UserModel {
  String? username;
  String? role;
  String? email;

  UserModel({
    this.username,
    this.role,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    role = json['role'];
    email = json['email'];
  }
}
