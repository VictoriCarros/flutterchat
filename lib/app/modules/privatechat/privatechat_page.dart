import 'package:chatzao/app/model/history.dart';
import 'package:chatzao/app/model/user.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:chatzao/app/utils/string_utils.dart';

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
                            fillColor: Colors.grey.withOpacity(0.2),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.6),
                                    width: 0.0),
                                borderRadius: BorderRadius.circular(20)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.6),
                                    width: 0.0),
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Aa"),
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
        var reversedList = widget.controller.messageList.reversed.toList();
        var message = reversedList[index];
        return message.idSender == widget.userLogado.id
            ? newUserTile(message)
            : newFriendTile(message);
      },
    );
  }

  ListTile newUserTile(History message) {
    return ListTile(
      onTap: () {
        widget.controller.switchMessageDateVisibility();
      },
      title: Column(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Observer(
              builder: (_) => Visibility(
                    child: Text(
                      "${message.date.toFormatedDate()}",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blueGrey.withOpacity(0.7)),
                    ),
                    visible: widget.controller.messageDateVisibility,
                  )),
        ),
        SizedBox(height: 10),
        Align(
            alignment: Alignment.bottomRight,
            child: Wrap(
              alignment: WrapAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      message.message,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ))
      ]),
      /*subtitle: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
            )),
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 16.0, top: 8.0),
          child: Text(
            message.message,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),*/
    );
  }

  ListTile newFriendTile(History message) {
    return ListTile(
      title: Wrap(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message.message,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }

  @override
  void dispose() {
    widget.inputController.dispose();
    widget.channel.sink.close();
    super.dispose();
  }
}
