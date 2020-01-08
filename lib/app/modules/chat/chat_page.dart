import 'package:chatzao/app/modules/chat/chat_controller.dart';
import 'package:chatzao/app/modules/chat/chat_module.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final User userLogado;

  ChatPage({Key key, @required this.userLogado}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatController controller = ChatModule.to.getBloc<ChatController>();
  _ChatPageState();

  @override
  void initState() {
    super.initState();
    controller.getUserFriendListFromRepo(widget.userLogado.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          header(widget.userLogado.photo),
          searchBar(controller),
          chatList(controller, widget.userLogado)
        ],
      ),
    );
  }
}

Widget circleImage(String image) {
  return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
      ));
}

Widget header(String photo) {
  return Padding(
      padding: EdgeInsets.only(top: 45.0, left: 12.0),
      child: Row(
        children: <Widget>[
          circleImage(photo),
          SizedBox(width: 10.0),
          Text("Bate-papos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0))
        ],
      ));
}

Widget searchBar(ChatController controller) {
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

Widget chatList(ChatController controller, User userLogado) {
  return Observer(
      builder: (_) => Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.friendList != null
                ? controller.friendList.length
                : 0,
            itemBuilder: (context, index) {
              var friend = controller.friendList[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PrivatechatModule(userLogado, friend.user)));
                },
                leading: circleImage('${friend.user.photo}'),
                title: Text("${friend.user.name}"),
                subtitle: Text("${friend.user.email}"),
              );
            },
          )));
}
