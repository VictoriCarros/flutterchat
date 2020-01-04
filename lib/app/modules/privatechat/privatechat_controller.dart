import 'package:mobx/mobx.dart';

part 'privatechat_controller.g.dart';

class PrivatechatController = _PrivatechatBase with _$PrivatechatController;

abstract class _PrivatechatBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
