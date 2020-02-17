import 'package:chatzao/app/modules/chat/chat_controller.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final int userId;

  ChatPage({Key key, @required this.userId}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatController controller = ChatController();
  _ChatPageState();

  @override
  void initState() {
    super.initState();
    controller.getUserById(widget.userId);
    controller.getFriendist(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[header(), searchBar(), chatList()],
      ),
    );
  }

  Widget circleImage(String image) {
    return Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
        ));
  }

  Widget header() {
    return Observer(
        builder: (_) => Padding(
            padding: EdgeInsets.only(top: 45.0, left: 12.0),
            child: Row(
              children: <Widget>[
                circleImage(controller.userLogado != null
                    ? controller.userLogado.photo
                    : "https://cdn5.vectorstock.com/i/1000x1000/51/99/icon-of-user-avatar-for-web-site-or-mobile-app-vector-3125199.jpg"),
                SizedBox(width: 15.0),
                Text("Bate-papos",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0))
              ],
            )));
  }

  Widget searchBar() {
    return Padding(
        padding: EdgeInsets.only(top: 18.0, left: 12.0, right: 12.0),
        child: TextField(
          onChanged: (text) {
            //controller.filterList =
          },
          decoration: InputDecoration(
              hintText: "Pesquisar",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        ));
  }

  Widget chatList() {
    return Observer(
        builder: (_) => Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.list != null ? controller.list.length : 0,
              itemBuilder: (context, index) {
                var friend = controller.list[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivatechatModule(
                                controller.userLogado, friend.user)));
                  },
                  leading: circleImage('${friend.user.photo}'),
                  title: Text("${friend.user.name}"),
                  subtitle: Text("${friend.user.email}"),
                );
              },
            )));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
