import 'package:chatzao/app/commom.dart';
import 'package:chatzao/app/modules/repository/login/login_remote.dart';

class LoginRepository {
  LoginRemote _loginRemote;
  LoginRepository(this._loginRemote);

  Future<Result> doLogin(String email, String password) {
    return _loginRemote.doLogin(email, password);
  }
}
