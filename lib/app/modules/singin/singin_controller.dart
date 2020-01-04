import 'package:chatzao/app/model/auth_data.dart';
import 'package:chatzao/app/modules/repository/login/login_repository.dart';
import 'package:chatzao/app/modules/singup/singup_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'singin_controller.g.dart';

class SinginController = _SinginBase with _$SinginController;

abstract class _SinginBase with Store {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final LoginRepository _repository = LoginRepository();

  Box _authDataBox;
  //Box = Table (mas sem estrutura definida, e pode conter qualquer coisa)
  //Boxes can also be encrypted to store sensitive data

  Future _openBox(String token) async {
    Hive.registerAdapter(AuthDataAdapter(), 3);

    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    _authDataBox = await Hive.openBox('authBox');

    AuthData authData =
        AuthData(email: email.text, password: password.text, token: token);

    int lastIndex = _authDataBox.toMap().length - 1;
    if (lastIndex < 0) {
      _authDataBox.add(authData);
    } else {
      print("email encontrado na box: ${authData.email}");
      _authDataBox.putAt(lastIndex, _authDataBox);
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  /* autoLogin() {
    WatchBoxBuilder(
      box: _authDataBox,
      builder: (context, box) {
        Map<dynamic, dynamic> raw = box.toMap();
        List list = raw.values.toList();
        if (list.length > 0) {
          AuthData authData = list[0];
          email.text = authData.email;
          password.text = authData.password;

          doLogin(context);
        }
      },
    );
  }
*/

  saveAuthData(String token) {
    _openBox(token);
  }

  doLogin(BuildContext context) {
    /*
    _repository.doLogin(email.text, password.text).then((data) => {
          if (data.auth == true)
            {
              saveAuthData(data.token),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeModule()),
              )
            }
          else
            {print("erro")}
        });*/

    saveAuthData("teste");
  }

  void showSingup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SingupModule()),
    );
  }
}
