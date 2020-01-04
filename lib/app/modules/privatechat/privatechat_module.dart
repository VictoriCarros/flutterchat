import 'package:chatzao/app/modules/privatechat/privatechat_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_page.dart';

class PrivatechatModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PrivatechatController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PrivatechatPage();

  static Inject get to => Inject<PrivatechatModule>.of();
}
