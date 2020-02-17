import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatzao/app/utils/constants.dart' as Constants;

Dio createDio() {
  return Dio(BaseOptions(
      connectTimeout: 5000, receiveTimeout: 5000, baseUrl: Constants.BASE_URL));
}

Dio addInterceptors(Dio dio) {
  return dio
    ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) => requestInterceptor(options),
        onResponse: (Response response) => responseInterceptor(response),
        onError: (DioError dioError) => errorInterceptor(dioError)));
}

dynamic requestInterceptor(RequestOptions options) async {
  if (options.headers.containsKey("requiresToken")) {
    //remove the auxiliary
    options.headers.remove("requiresToken");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = prefs.get("Header");

    options.headers.addAll({"Header": "$header${DateTime.now()}"});
  }

  return options;
}

dynamic responseInterceptor(Response options) async {
  return options;
}

dynamic errorInterceptor(DioError dioError) {
  return dioError;
}
