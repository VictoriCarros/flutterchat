import 'package:chatzao/app/model/constants.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:dio/dio.dart';

class UserRemote {
  final String _endpoint = "${Constants.ENDPOINT}";

  final Dio _dio = Dio();

  Future<User> getUserByEmail(String email) async {
    Response response = await _dio.get("$_endpoint/user/email/$email");
    return User.fromJson(response.data);
  }

  Future<User> getUserById(int id) async {
    Response response = await _dio.get("$_endpoint/user/id/$id");
    return User.fromJson(response.data);
  }

  Future<List<UserFriendList>> getUserFriendList(int idUser) async {
    Response response = await _dio.get("$_endpoint/friendlist/$idUser");
    final list = response.data as List;
    return list.map((i) => UserFriendList.fromJson(i)).toList();
  }
}
