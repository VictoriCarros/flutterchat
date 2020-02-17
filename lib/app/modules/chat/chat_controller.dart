import 'package:chatzao/app/commom.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:chatzao/app/modules/repository/user/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatBase with _$ChatController;

abstract class _ChatBase with Store {
  UserRepository _userRepository;

  @observable
  User userLogado;

  @observable
  ObservableList<UserFriendList> list;

  @observable
  Result result;

  @action
  Future getFriendist(int idUser) async {
    // List<UserFriendList> response =
    //     await _userRepository.getUserFriendList(idUser);
    // friendList = response;
    result = Result.loading();
    result = await _userRepository.getUserFriendList(idUser);

    if (result.hasSuccessData())
      list = result.getSuccessData() as ObservableList<UserFriendList>;
  }

  @action
  Future getUserById(int idUser) async {
    User response = await _userRepository.getUserById(idUser);
    userLogado = response;
  }
}
