import 'package:chatzao/app/modules/repository/login/login_remote.dart';

import '../../../model/login.dart';

class LoginRepository {
  LoginRemote remote = LoginRemote();

  Future<Login> doLogin(String email, String password) {
    return remote.doLogin(email, password);
  }
}
