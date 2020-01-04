import 'package:chatzao/app/model/constants.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:dio/dio.dart';

class UserRemote {
  //final String _endpoint = "${Constants.ENDPOINT}/api/user/";
  //final String _endpoint = "${Constants.ENDPOINT}/414oJUu1_";

  final Dio _dio = Dio();

  Future<User> getUser() async {
    Response response = await _dio.get("http://192.168.0.2:8888/user/1");
    print("response ${response.data}");
    return User.fromJson(response.data);
  }

  Future<List<UserFriendList>> getUserFriendList() async {
    Response response = await _dio.get("http://192.168.0.2:8888/friendList/1");
    //Response response = await _dio.get("${Constants.ENDPOINT}/VkuVmLdyd");
    print("response ${response.data}");
    final list = response.data as List;
    return list.map((i) => UserFriendList.fromJson(i)).toList();
  }
}
