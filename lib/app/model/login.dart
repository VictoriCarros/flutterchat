class Login {
  bool auth;
  String token;

  Login({this.auth, this.token});

  Login.fromJson(Map<String, dynamic> json) {
    auth = json['auth'];
    token = json['token'];
  }
}
