import 'package:chatzao/app/model/login_response.dart';
import 'package:chatzao/app/modules/chat/chat_module.dart';
import 'package:chatzao/app/modules/repository/login/login_repository.dart';
import 'package:chatzao/app/modules/singup/singup_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../commom.dart';

part 'singin_controller.g.dart';

class SinginController = _SinginBase with _$SinginController;

abstract class _SinginBase with Store {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginRepository _loginRepository;
  _SinginBase(this._loginRepository);

  @observable
  Result result;

  @observable
  LoginResponse _loginResponse;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @action
  Future doLogin(BuildContext context) async {
    result = Result.loading();
    result = await _loginRepository.doLogin(
        emailController.text, passwordController.text);

    if (result.hasSuccessData()) {
      _loginResponse = result.getSuccessData() as LoginResponse;
    }
  }

  void showSingup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SingupModule()),
    );
  }
}
