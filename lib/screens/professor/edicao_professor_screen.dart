import 'package:flutter/material.dart';
import 'package:school_portal_app/models/professor_model.dart';
import 'package:school_portal_app/repository/professor_repository.dart';

class EdicaoProfessorScreen extends StatefulWidget {
  EdicaoProfessorScreen({Key key}) : super(key: key);

  @override
  _EdicaoProfessorScreenState createState() => _EdicaoProfessorScreenState();
}

class _EdicaoProfessorScreenState extends State<EdicaoProfessorScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ProfessorRepository professorRepository = ProfessorRepository();
  ProfessorModel professorModel;

  @override
  Widget build(BuildContext context) {
    professorModel = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('FIAPP',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.w500,
              )),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.pink,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 100,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Cadastrar novo Professor",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      ),
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.people_outline),
                          fillColor: Colors.white,
                          hintText: 'Digite o seu Nome',
                          labelText: "Nome"),
                      initialValue: professorModel.nome.toString(),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Precisamos do seu nome para o cadastro';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        professorModel.nome = value;
                      },
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.person_pin),
                          fillColor: Colors.white,
                          hintText: 'Digite o seu RM',
                          labelText: "RM"),
                      initialValue: professorModel.rm.toString(),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite o RM para logar';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        professorModel.rm = value;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.lock),
                        fillColor: Colors.white,
                        hintText: 'Digite sua senha',
                        labelText: 'Senha',
                      ),
                      initialValue: professorModel.senha.toString(),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite a senha';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        professorModel.senha = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        child: Text("Cadastrar",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        color: Colors.pink,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();

                            professorRepository.create(professorModel);

                            Navigator.pop(context);
                          } else {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Não foi cadastrar um novo professor',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
