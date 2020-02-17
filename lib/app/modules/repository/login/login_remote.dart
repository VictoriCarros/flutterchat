import 'package:chatzao/app/commom.dart';
import 'package:chatzao/app/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:chatzao/app/utils/shared_pref.dart';
import 'package:chatzao/app/service/dio_config/base_dio.dart';
import 'package:chatzao/app/service/dio_config/logging_interceptors.dart';
import 'package:chatzao/app/utils/constants.dart' as Constants;

class LoginRemote {
  Future<Result> doLogin(String email, String password) async {
    Dio dio = createDio();
    dio.interceptors.add(LogginInterceptors());
    Result result;
    final path = Constants.LOGIN_PATH;
    SharedPref sharedPref = SharedPref();

    try {
      final response = {"token": "", "auth": true, "id": 3, "expiresIn": 0};
      // final response =
      //     await dio.post(path, data: {"email": email, "password": password});
      final loginResponse = LoginResponse.fromJson(response); //response.data
      result = Result.success(loginResponse);
      sharedPref.save("token",
          loginResponse.token.replaceAll("Bearer", "").replaceAll(" ", ""));
      sharedPref.save("email", email);
      sharedPref.save("pass", password);
      sharedPref.save("expiresIn", loginResponse.expiresIn.toString());

      return result;
    } on DioError catch (error) {
      if (400 <= error.response.statusCode &&
          error.response.statusCode <= 499) {
        result = Result.error(CustomError("E-mail ou senha inválidos."));
      } else {
        result = Result.error(CustomError(error.message));
      }
      return result;
    }
  }
}
