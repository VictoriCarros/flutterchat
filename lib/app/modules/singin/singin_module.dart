import 'package:chatzao/app/modules/singin/singin_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:chatzao/app/modules/singin/singin_page.dart';

class SinginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SinginController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SinginPage();

  static Inject get to => Inject<SinginModule>.of();
}
