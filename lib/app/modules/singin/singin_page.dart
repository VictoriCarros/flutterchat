import 'package:chatzao/app/modules/singin/singin_controller.dart';
import 'package:flutter/material.dart';

class SinginPage extends StatefulWidget {
  final String title;
  const SinginPage({Key key, this.title = "Singin"}) : super(key: key);

  @override
  _SinginPageState createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  @override
  Widget build(BuildContext context) {
    SinginController singinController = SinginController();
    //singinController.autoLogin();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            controller: singinController.email,
            decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                  const Radius.circular(16.0),
                )),
                prefixIcon: Icon(Icons.mail),
                hintText: "E-mail"),
          ),
          SizedBox(height: 12),
          TextField(
            controller: singinController.password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              )),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          FlatButton(
            onPressed: () {
              print("Recuperar senha");
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("Esqueci minha senha",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ),
          SizedBox(height: 25),
          ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: 50, minWidth: double.infinity),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(16.0)),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  singinController.doLogin(context);
                },
                child: Text("Entrar")),
          ),
          SizedBox(height: 16),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minHeight: 50, minWidth: double.infinity),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(16.0)),
                color: Color.fromRGBO(0, 0, 0, 0.3),
                textColor: Colors.white,
                onPressed: () {
                  singinController.showSingup(context);
                },
                child: Text("Novo usuário"),
              ))
        ],
      ),
    ));
  }
}
