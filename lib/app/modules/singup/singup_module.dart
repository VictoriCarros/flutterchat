import 'package:chatzao/app/modules/singup/singup_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:chatzao/app/modules/singup/singup_page.dart';

class SingupModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SingupController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SingupPage();

  static Inject get to => Inject<SingupModule>.of();
}
