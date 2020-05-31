import 'package:flutter/material.dart';
import 'package:school_portal_app/models/professor_model.dart';
import 'package:school_portal_app/repository/professor_repository.dart';

class CadastroTarefaScreen extends StatefulWidget {
  CadastroTarefaScreen({Key key}) : super(key: key);

  @override
  _CadastroTarefaScreenState createState() => _CadastroTarefaScreenState();
}

class _CadastroTarefaScreenState extends State<CadastroTarefaScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ProfessorRepository professorRepository = ProfessorRepository();
  ProfessorModel professorModel = ProfessorModel();

  String dropdownValue;
  @override
  Widget build(BuildContext context) {
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
                      "Cadastro Tarefa",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      ),
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.book),
                          fillColor: Colors.white,
                          hintText: 'Digite o titulo da tarefa',
                          labelText: "Título"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'O campo Título é obrigatório.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        professorModel.nome = value;
                      },
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      isExpanded: true,
                      elevation: 16,
                      iconEnabledColor: Colors.pink,
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      hint: Row(
                        children: [
                          Icon(
                            Icons.view_list,
                            color: Colors.grey,
                          ),
                          Text('Tipo de Tarefa'),
                        ],
                      ),
                      style: TextStyle(color: Colors.grey),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Prova', 'Trabalho', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.date_range),
                        fillColor: Colors.white,
                        hintText: 'Digite a data de entrega',
                        labelText: 'Entrega',
                      ),
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
                    FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5),
                              maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.zh);
                        },
                        child: Text(
                          'show date time picker (Chinese)',
                          style: TextStyle(color: Colors.blue),
                        )),
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
