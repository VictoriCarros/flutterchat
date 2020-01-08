import 'package:chatzao/app/model/history.dart';
import 'package:chatzao/app/modules/repository/history/history_repository.dart';
import 'package:mobx/mobx.dart';

part 'privatechat_controller.g.dart';

class PrivatechatController = _PrivatechatBase with _$PrivatechatController;

abstract class _PrivatechatBase with Store {
  final HistoryRepository _repository = HistoryRepository();

  @observable
  List<History> messageList;

  List<History> _messageList = [];

  @action
  Future sendMessageToServer(History history) async {
    await _repository.newMessage(history.toJson());
  }

  @action
  Future getHistory(int idUser, int idFriend) async {
    List<History> response = await _repository.getHistory(idUser, idFriend);
    messageList = response;
    _messageList = response;
  }

  @action
  updateMessageList(History history) {
    _messageList.add(history);
    messageList = _messageList;
  }
}
