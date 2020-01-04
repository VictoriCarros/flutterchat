import 'package:chatzao/app/model/userfriendlist.dart';
import 'package:chatzao/app/modules/chat/chat_controller.dart';
import 'package:chatzao/app/modules/chat/chat_module.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key key, this.title = "Chat"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    ChatController controller = ChatModule.to.getBloc<ChatController>();

    return Scaffold(
      body: Column(
        children: <Widget>[
          header(),
          searchBar(controller),
          chatList(controller)
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

Widget header() {
  return Padding(
      padding: EdgeInsets.only(top: 45.0, left: 12.0),
      child: Row(
        children: <Widget>[
          circleImage("https://i.imgur.com/BoN9kdC.png"),
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

Widget chatList(ChatController controller) {
  return Observer(
      builder: (_) => FutureBuilder<List<UserFriendList>>(
          future: controller.getUserFriendListFromRepo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivatechatModule(),
                            settings: RouteSettings(
                                arguments: snapshot.data[index].user)),
                      );
                    },
                    leading: circleImage('${snapshot.data[index].user.photo}'),
                    title: Text("${snapshot.data[index].user.name}"),
                    subtitle: Text("${snapshot.data[index].user.email}"),
                  );
                },
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }));
}
