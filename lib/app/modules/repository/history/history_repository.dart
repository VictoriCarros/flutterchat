import 'package:chatzao/app/model/history.dart';
import 'package:chatzao/app/modules/repository/history/history_remote.dart';

class HistoryRepository {
  HistoryRemote remote = HistoryRemote();

  Future newMessage(Map body) {
    return remote.newMessage(body);
  }

  Future<List<History>> getHistory(int idUser, idFriend) {
    return remote.getHistory(idUser, idFriend);
  }
}
