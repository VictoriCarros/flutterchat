import 'package:chatzao/app/modules/chat/chat_module.dart';
import 'package:chatzao/app/modules/login/login_module.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginModule(),
    );
  }
}
