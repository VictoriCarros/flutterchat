import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:chatzao/app/modules/repository/user/user_remote.dart';

class UserRepository {
  UserRemote remote = UserRemote();

  Future<User> getUserById(int id) {
    return remote.getUserById(id);
  }

  Future<User> getUserByEmail(String email) {
    return remote.getUserByEmail(email);
  }

  Future<List<UserFriendList>> getUserFriendList(int idUser) {
    return remote.getUserFriendList(idUser);
  }
}
