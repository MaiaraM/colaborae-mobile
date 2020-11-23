class LoginModel {
  final String username;
  final String password;

  LoginModel({this.username, this.password});

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "password": password == null ? null : password,
      };
}
