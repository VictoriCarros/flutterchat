import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:chatzao/app/modules/repository/user/user_remote.dart';

class UserRepository {
  UserRemote remote = UserRemote();

  Future<User> getUser() {
    return remote.getUser();
  }

  Future<List<UserFriendList>> getUserFriendList(int idUser) {
    return remote.getUserFriendList(idUser);
  }
}
