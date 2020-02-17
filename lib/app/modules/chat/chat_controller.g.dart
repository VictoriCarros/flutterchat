// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatBase, Store {
  final _$userLogadoAtom = Atom(name: '_ChatBase.userLogado');

  @override
  User get userLogado {
    _$userLogadoAtom.context.enforceReadPolicy(_$userLogadoAtom);
    _$userLogadoAtom.reportObserved();
    return super.userLogado;
  }

  @override
  set userLogado(User value) {
    _$userLogadoAtom.context.conditionallyRunInAction(() {
      super.userLogado = value;
      _$userLogadoAtom.reportChanged();
    }, _$userLogadoAtom, name: '${_$userLogadoAtom.name}_set');
  }

  final _$listAtom = Atom(name: '_ChatBase.list');

  @override
  ObservableList<UserFriendList> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<UserFriendList> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$resultAtom = Atom(name: '_ChatBase.result');

  @override
  Result get result {
    _$resultAtom.context.enforceReadPolicy(_$resultAtom);
    _$resultAtom.reportObserved();
    return super.result;
  }

  @override
  set result(Result value) {
    _$resultAtom.context.conditionallyRunInAction(() {
      super.result = value;
      _$resultAtom.reportChanged();
    }, _$resultAtom, name: '${_$resultAtom.name}_set');
  }

  final _$getFriendistAsyncAction = AsyncAction('getFriendist');

  @override
  Future getFriendist(int idUser) {
    return _$getFriendistAsyncAction.run(() => super.getFriendist(idUser));
  }

  final _$getUserByIdAsyncAction = AsyncAction('getUserById');

  @override
  Future getUserById(int idUser) {
    return _$getUserByIdAsyncAction.run(() => super.getUserById(idUser));
  }
}
