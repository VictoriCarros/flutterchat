import 'package:chatzao/app/commom.dart';
import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:chatzao/app/utils/constants.dart' as Constants;
import 'package:chatzao/app/model/user.dart';
import 'package:dio/dio.dart';
import 'package:chatzao/app/service/dio_config/base_dio.dart';
import 'package:chatzao/app/service/dio_config/logging_interceptors.dart';
import 'package:chatzao/app/utils/shared_pref.dart';
import 'package:mobx/mobx.dart';

class UserRemote {
  final Dio _dio = Dio();

  Future<User> getUserByEmail(String email) async {
    Response response =
        await _dio.get("${Constants.BASE_URL}/user/email/$email");
    return User.fromJson(response.data);
  }

  Future<User> getUserById(int id) async {
    Response response = await _dio.get("${Constants.BASE_URL}/user/id/$id");
    return User.fromJson(response.data);
  }

  Future<Result> getUserFriendList(int idUser) async {
    // Response response =
    //     await _dio.get("${Constants.BASE_URL}/friendlist/$idUser");
    // final list = response.data as List;
    // return list.map((i) => UserFriendList.fromJson(i)).toList();

    final dio = createDio();
    dio.interceptors.add(LogginInterceptors());
    final map = Map<String, dynamic>();
    Result result;
    final path = Constants.USERLIST_PATH;
    SharedPref sharedPref = SharedPref();

    try {
      String token = await sharedPref.read("token");
      map["Authorization"] = "Bearer $token";
      dio.options.headers = map;
    } catch (Exception) {
      print("ah shit, here we go again...");
    }

    try {
      final response = await dio.get(path);
      final list = response.data as List;
      final listUser =
          list.map((user) => UserFriendList.fromJson(user)).toList();
      ObservableList<UserFriendList> observableList =
          ObservableList<UserFriendList>();
      observableList.addAll(listUser);
      result = Result.success(observableList);
    } on DioError catch (error) {
      result = Result.error(CustomError(error.message));
      return result;
    }

    return result;
  }
}
