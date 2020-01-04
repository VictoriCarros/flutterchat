import 'package:hive/hive.dart';

part 'auth_data.g.dart';

@HiveType()
class AuthData {
  @HiveField(0)
  String token;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;

  AuthData({this.token, this.email, this.password});
}
