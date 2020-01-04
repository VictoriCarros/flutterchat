import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'singup_controller.g.dart';

class SingupController = _SingupBase with _$SingupController;

abstract class _SingupBase with Store {
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confirmarSenha = TextEditingController();

  @action
  void doSingup() {
    print("cadastrar ${nome.text}");
  }
}
