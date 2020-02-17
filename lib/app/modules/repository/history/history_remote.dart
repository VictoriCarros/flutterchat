import 'package:chatzao/app/utils/constants.dart' as Constants;
import 'package:chatzao/app/model/history.dart';
import 'package:dio/dio.dart';

class HistoryRemote {
  final Dio _dio = Dio();
  final String _baseUrl = Constants.BASE_URL;

  Future newMessage(Map body) async {
    await _dio.post("$_baseUrl/newMessage", data: body,
        onSendProgress: (int sent, int total) {
      print("newMessage: $body");
      print("newMessage: $sent / $total");
    }).catchError((e) => print("newMessage error $e"));
  }

  Future<List<History>> getHistory(int idUser, int idFriend) async {
    Response response =
        await _dio.get("$_baseUrl/history/user/$idUser/friend/$idFriend");
    print("history response $response");
    final list = response.data as List;
    return list.map((i) => History.fromJson(i)).toList();
  }
}
