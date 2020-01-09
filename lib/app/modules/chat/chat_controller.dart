import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:chatzao/app/modules/repository/user/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatBase with _$ChatController;

abstract class _ChatBase with Store {
  final UserRepository _repository = UserRepository();

  @observable
  User userLogado;

  @observable
  List<UserFriendList> friendList;

  @action
  Future getUserFriendListFromRepo(int idUser) async {
    List<UserFriendList> response = await _repository.getUserFriendList(idUser);
    friendList = response;
  }

  @action
  Future getUserById(int idUser) async {
    User response = await _repository.getUserById(idUser);
    userLogado = response;
  }
}
