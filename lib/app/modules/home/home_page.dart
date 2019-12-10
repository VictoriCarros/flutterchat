import 'package:chatzao/app/modules/home/home_controller.dart';
import 'package:chatzao/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeController home = HomeModule.to.getBloc<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) => Text('${home.value}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          home.increment();
        },
        child: Icon(Icons.plus_one),
        backgroundColor: Colors.green,
      ),
    );
  }
}
