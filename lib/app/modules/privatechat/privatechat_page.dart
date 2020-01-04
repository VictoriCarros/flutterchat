import 'package:chatzao/app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PrivatechatPage extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect("wss://echo.websocket.org/");

  @override
  _PrivatechatPageState createState() => _PrivatechatPageState();
}

class _PrivatechatPageState extends State<PrivatechatPage> {
  final List<String> messageList = [];
  final WebSocketChannel channel;

  final inputController = TextEditingController();

  _PrivatechatPageState({this.channel}) {
    /*channel.stream.listen((data) {
      setState(() {
        messageList.add(data);
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: inputController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Mensagem"),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                        width: 40,
                        child: FlatButton(
                          onPressed: () {
                            if (inputController.text.isNotEmpty) {
                              channel.sink.add(inputController.text);
                              inputController.text = "";
                            }
                          },
                          padding: EdgeInsets.all(0.0),
                          child: Image.network(
                            "https://img.icons8.com/plasticine/2x/sent.png",
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: getMessageList(),
                /*
                  child: StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    messageList.add(snapshot.data);
                  }

                  return getMessageList();
                },
              )*/
              )
            ],
          ),
        ));
  }

  ListView getMessageList() {
    List<Widget> listWidget = [];

    for (String msg in messageList) {
      listWidget.add(ListTile(
        title: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg,
              style: TextStyle(fontSize: 16),
            ),
          ),
          color: Colors.teal[50],
          height: 40,
        ),
      ));
    }

    return ListView(children: listWidget);
  }

  @override
  void dispose() {
    inputController.dispose();
    channel.sink.close();
    super.dispose();
  }
}
