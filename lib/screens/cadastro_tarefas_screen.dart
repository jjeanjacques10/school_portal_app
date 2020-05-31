import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:school_portal_app/models/tarefas_model.dart';
import 'package:school_portal_app/repository/tarefas_repository.dart';

class CadastroTarefasScreen extends StatefulWidget {
  CadastroTarefasScreen({Key key}) : super(key: key);

  @override
  _CadastroTarefasScreenState createState() => _CadastroTarefasScreenState();
}

class _CadastroTarefasScreenState extends State<CadastroTarefasScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TarefasRepository tarefasRepository = TarefasRepository();
  TarefasModel tarefasModel = TarefasModel();

  String dropdownTipo;
  String dropdownTurma;
  String dropdownDisciplina;

  final format = DateFormat("dd/MM/yyyy");
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
                      "Cadastro Tarefas",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.list),
                          fillColor: Colors.white,
                          hintText: 'Selecione o tipo da tarefa',
                          labelText: "Tipo"),
                      value: dropdownTipo,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      isExpanded: true,
                      elevation: 16,
                      iconEnabledColor: Colors.pink,
                      style: TextStyle(color: Colors.grey),
                      onChanged: (String newValue) {
                        setState(() {
                          tarefasModel.tipo = newValue;
                          dropdownTipo = newValue;
                        });
                      },
                      items: ['Prova', 'Trabalho']
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.group),
                          fillColor: Colors.white,
                          hintText: 'Selecione a turma',
                          labelText: "Turma"),
                      value: dropdownTurma,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      isExpanded: true,
                      elevation: 16,
                      iconEnabledColor: Colors.pink,
                      style: TextStyle(color: Colors.grey),
                      onChanged: (String newValue) {
                        setState(() {
                          tarefasModel.turma = newValue;
                          dropdownTurma = newValue;
                        });
                      },
                      items: ['3SIA', '3SIT', '3SIR']
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.school),
                          fillColor: Colors.white,
                          hintText: 'Selecione a disciplina',
                          labelText: "Disciplina"),
                      value: dropdownDisciplina,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      isExpanded: true,
                      elevation: 16,
                      iconEnabledColor: Colors.pink,
                      style: TextStyle(color: Colors.grey),
                      onChanged: (String newValue) {
                        setState(() {
                          tarefasModel.disciplina = newValue;
                          dropdownDisciplina = newValue;
                        });
                      },
                      items: ['Flutter', 'Redes', 'Kotlin']
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.book),
                          fillColor: Colors.white,
                          hintText: 'Digite o titulo da Tarefas',
                          labelText: "Título"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'O campo Título é obrigatório.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        tarefasModel.titulo = value;
                      },
                    ),
                    DateTimeField(
                      decoration: new InputDecoration(
                          icon: const Icon(Icons.date_range),
                          fillColor: Colors.white,
                          hintText: 'Escolha a data',
                          labelText: "Data"),
                      format: format,
                      onShowPicker: (context, currentValue) {
                        tarefasModel.data =
                            currentValue ?? DateTime.now().toString();
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
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

                            tarefasRepository.create(tarefasModel);

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
