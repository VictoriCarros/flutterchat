import 'package:dio/dio.dart';

import '../../../model/constants.dart';
import '../../../model/login.dart';

class LoginRemote {
  final String _endpoint = "${Constants.ENDPOINT}/api/access/login";
  final Dio _dio = Dio();

  Future<Login> doLogin(String email, String password) async {
    Response response = await _dio
        .post(_endpoint, data: {"email": email, "password": password});
    return Login.fromJson(response.data);
  }
}
