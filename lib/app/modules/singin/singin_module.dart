import 'package:chatzao/app/modules/repository/login/login_remote.dart';
import 'package:chatzao/app/modules/repository/login/login_repository.dart';
import 'package:chatzao/app/modules/singin/singin_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:chatzao/app/modules/singin/singin_page.dart';

class SinginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SinginController(i.getDependency())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LoginRepository(i.getDependency())),
        Dependency((i) => LoginRemote())
      ];

  @override
  Widget get view => SinginPage();

  static Inject get to => Inject<SinginModule>.of();
}
