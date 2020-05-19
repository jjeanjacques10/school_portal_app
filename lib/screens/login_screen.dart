import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('FIAP Professor', style: TextStyle(color: Colors.pink)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Center(
                  child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.person_pin),
                      fillColor: Colors.black,
                      hintText: 'Digite o seu RM',
                      labelText: 'RM',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o RM para logar';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.lock),
                      fillColor: Colors.black,
                      hintText: 'Digite sua senha',
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite a senha para logar';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      child: Text("Entrar",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      color: Colors.pink,
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();

                          Navigator.pop(
                            context,
                            "Olá",
                          );
                        } else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não foi possível faze o login.',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
