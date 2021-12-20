// To parse this JSON data, do
//

class UserModel {
  final String username;
  final String password;
  final String email;
  UserModel({
    required this.username,
    required this.password,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }
}
