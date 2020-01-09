class Login {
  int userId;
  String token;
  int expiresIn;

  Login({this.userId, this.token, this.expiresIn});

  Login.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
    expiresIn = json['expiresIn'];
  }
}
