// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatBase, Store {
  final _$friendListAtom = Atom(name: '_ChatBase.friendList');

  @override
  List<UserFriendList> get friendList {
    _$friendListAtom.context.enforceReadPolicy(_$friendListAtom);
    _$friendListAtom.reportObserved();
    return super.friendList;
  }

  @override
  set friendList(List<UserFriendList> value) {
    _$friendListAtom.context.conditionallyRunInAction(() {
      super.friendList = value;
      _$friendListAtom.reportChanged();
    }, _$friendListAtom, name: '${_$friendListAtom.name}_set');
  }

  final _$getUserFriendListFromRepoAsyncAction =
      AsyncAction('getUserFriendListFromRepo');

  @override
  Future getUserFriendListFromRepo(int idUser) {
    return _$getUserFriendListFromRepoAsyncAction
        .run(() => super.getUserFriendListFromRepo(idUser));
  }
}
