import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

//Responsável pelas regras de negócios e dados
abstract class _HomeBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
