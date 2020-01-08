import 'package:chatzao/app/model/constants.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:dio/dio.dart';

class UserRemote {
  final String _endpoint = "${Constants.ENDPOINT}";

  final Dio _dio = Dio();

  Future<User> getUser() async {
    Response response = await _dio.get("http://10.0.0.174:8888/user/1");
    print("response ${response.data}");
    return User.fromJson(response.data);
  }

  Future<List<UserFriendList>> getUserFriendList(int idUser) async {
    Response response = await _dio.get("$_endpoint/friendlist/$idUser");
    final list = response.data as List;
    return list.map((i) => UserFriendList.fromJson(i)).toList();
  }
}
