import 'package:chatzao/app/modules/home/home_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:chatzao/app/modules/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeController()),
      ];

  @override
  List<Dependency> get dependencies => [Dependency((i) => HomeController())];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}