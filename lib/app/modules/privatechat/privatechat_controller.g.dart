// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privatechat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrivatechatController on _PrivatechatBase, Store {
  final _$messageDateVisibilityAtom =
      Atom(name: '_PrivatechatBase.messageDateVisibility');

  @override
  bool get messageDateVisibility {
    _$messageDateVisibilityAtom.context
        .enforceReadPolicy(_$messageDateVisibilityAtom);
    _$messageDateVisibilityAtom.reportObserved();
    return super.messageDateVisibility;
  }

  @override
  set messageDateVisibility(bool value) {
    _$messageDateVisibilityAtom.context.conditionallyRunInAction(() {
      super.messageDateVisibility = value;
      _$messageDateVisibilityAtom.reportChanged();
    }, _$messageDateVisibilityAtom,
        name: '${_$messageDateVisibilityAtom.name}_set');
  }

  final _$messageListAtom = Atom(name: '_PrivatechatBase.messageList');

  @override
  List<History> get messageList {
    _$messageListAtom.context.enforceReadPolicy(_$messageListAtom);
    _$messageListAtom.reportObserved();
    return super.messageList;
  }

  @override
  set messageList(List<History> value) {
    _$messageListAtom.context.conditionallyRunInAction(() {
      super.messageList = value;
      _$messageListAtom.reportChanged();
    }, _$messageListAtom, name: '${_$messageListAtom.name}_set');
  }

  final _$sendMessageToServerAsyncAction = AsyncAction('sendMessageToServer');

  @override
  Future sendMessageToServer(History history) {
    return _$sendMessageToServerAsyncAction
        .run(() => super.sendMessageToServer(history));
  }

  final _$getHistoryAsyncAction = AsyncAction('getHistory');

  @override
  Future getHistory(int idUser, int idFriend) {
    return _$getHistoryAsyncAction
        .run(() => super.getHistory(idUser, idFriend));
  }

  final _$_PrivatechatBaseActionController =
      ActionController(name: '_PrivatechatBase');

  @override
  dynamic updateMessageList(History history) {
    final _$actionInfo = _$_PrivatechatBaseActionController.startAction();
    try {
      return super.updateMessageList(history);
    } finally {
      _$_PrivatechatBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchMessageDateVisibility() {
    final _$actionInfo = _$_PrivatechatBaseActionController.startAction();
    try {
      return super.switchMessageDateVisibility();
    } finally {
      _$_PrivatechatBaseActionController.endAction(_$actionInfo);
    }
  }
}
