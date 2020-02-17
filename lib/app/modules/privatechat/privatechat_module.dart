import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:chatzao/app/modules/repository/login/login_remote.dart';
import 'package:chatzao/app/modules/repository/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_page.dart';

class PrivatechatModule extends ModuleWidget {
  User userLogado;
  User friend;

  PrivatechatModule(this.userLogado, this.friend);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => PrivatechatController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LoginRepository(i.getDependency())),
        Dependency((i) => LoginRemote())
      ];

  @override
  Widget get view => PrivatechatPage(userLogado: userLogado, friend: friend);

  static Inject get to => Inject<PrivatechatModule>.of();
}
