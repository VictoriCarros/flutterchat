import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/modules/chat/chat_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:chatzao/app/modules/chat/chat_page.dart';

class ChatModule extends ModuleWidget {
  final User userLogado;
  ChatModule({this.userLogado});

  @override
  List<Bloc> get blocs => [
        Bloc((i) => ChatController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ChatPage(userLogado: userLogado);

  static Inject get to => Inject<ChatModule>.of();
}
