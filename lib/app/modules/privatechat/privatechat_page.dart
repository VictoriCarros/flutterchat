import 'package:chatzao/app/model/history.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PrivatechatPage extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect("wss://echo.websocket.org/");
  final User userLogado;
  final User friend;
  final inputController = TextEditingController();
  final PrivatechatController controller = PrivatechatController();

  PrivatechatPage({Key key, @required this.userLogado, @required this.friend})
      : super(key: key);

  @override
  _PrivatechatPageState createState() => _PrivatechatPageState();
}

class _PrivatechatPageState extends State<PrivatechatPage> {
  _PrivatechatPageState();

  @override
  void initState() {
    super.initState();
    widget.controller.getHistory(widget.userLogado.id, widget.friend.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.friend.name),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  return Observer(
                      builder: (_) => Expanded(child: createList()));
                },
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: widget.inputController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Mensagem"),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        _sendMessage();
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Icon(Icons.send),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _sendMessage() {
    if (widget.inputController.text.isNotEmpty) {
      var hist = History(
          message: widget.inputController.text,
          date: DateTime.now().toIso8601String(),
          idFriend: widget.friend.id,
          idSender: widget.userLogado.id,
          idUser: widget.userLogado.id);

      widget.channel.sink.add(hist);
      widget.controller.updateMessageList(hist);
      widget.controller.sendMessageToServer(hist);
      widget.inputController.text = "";
    }
  }

  ListView createList() {
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemCount: widget.controller.messageList != null
          ? widget.controller.messageList.length
          : 0,
      itemBuilder: (context, index) {
        var message = widget.controller.messageList[index];
        return message.idSender == widget.userLogado.id
            ? newUserTile(message)
            : newFriendTile(message);
      },
    );
  }

  ListTile newUserTile(History message) {
    return ListTile(
      title: Container(
          color: Colors.teal[50],
          child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 30.0, top: 8.0),
              child: Text(
                widget.userLogado.name,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ])),
      subtitle: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Text(
            message.message,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16),
          ),
        ),
        color: Colors.teal[50],
        // height: 40,
      ),
    );
  }

  ListTile newFriendTile(History message) {
    return ListTile(
      title: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Text(
            widget.friend.name,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
        ),
        color: Colors.teal[50],
        //height: 40,
      ),
      subtitle: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Text(
            message.message,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
        ),
        color: Colors.teal[50],
        //height: 40,
      ),
    );
  }

  @override
  void dispose() {
    widget.inputController.dispose();
    widget.channel.sink.close();
    super.dispose();
  }
}
