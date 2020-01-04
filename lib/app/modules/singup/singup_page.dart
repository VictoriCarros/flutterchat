import 'package:chatzao/app/modules/singup/singup_controller.dart';
import 'package:flutter/material.dart';

class SingupPage extends StatefulWidget {
  final String title;
  const SingupPage({Key key, this.title = "Singup"}) : super(key: key);

  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    SingupController controller = SingupController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text("Singup"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller.email,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(16.0),
                    )),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Nome completo"),
              ),
              SizedBox(height: 12),
              TextField(
                controller: controller.email,
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
                controller: controller.senha,
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
              SizedBox(height: 12),
              TextField(
                controller: controller.confirmarSenha,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmar senha",
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    const Radius.circular(16.0),
                  )),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 50, minWidth: double.infinity),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(16.0)),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      //controller.doLogin();
                    },
                    child: Text("Enviar dados")),
              )
            ],
          )),
    );
  }
}
