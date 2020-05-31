import 'package:flutter/material.dart';
import 'package:school_portal_app/components/chamada_card.dart';
import 'package:school_portal_app/components/tarefas_card.dart';
import 'package:school_portal_app/models/chamada_aluno.dart';
import 'package:school_portal_app/models/tarefas_model.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/chamada_aluno_repository.dart';
import 'package:intl/intl.dart';
import 'package:school_portal_app/repository/tarefas_repository.dart';

class TarefasDetalhesScreen extends StatefulWidget {
  TarefasDetalhesScreen({Key key}) : super(key: key);

  @override
  _TarefasDetalhesScreenState createState() => _TarefasDetalhesScreenState();
}

class _TarefasDetalhesScreenState extends State<TarefasDetalhesScreen> {
  TarefasRepository tarefaRepository = new TarefasRepository();
  TurmaModel turmaModel;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    turmaModel = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                  child: Text(
                    'Tarefas',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Text(
                    '${turmaModel.disciplina} | ${turmaModel.nome} ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: chamadaList(turmaModel),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                          child: const Text('Voltar',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget chamadaList(TurmaModel turmaModel) {
    return FutureBuilder<List>(
      future: tarefaRepository.findTarefaTurma(turmaModel.nome),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length > 0) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: Text("Nenhuma Tarefa cadastrada!"),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView buildListView(List<TarefasModel> tarefas) {
    return ListView.builder(
      itemCount: tarefas == null ? 0 : tarefas.length,
      itemBuilder: (BuildContext ctx, int index) {
        TarefasModel tarefa = tarefas[index];

        return TarefasCard(
          tarefa: tarefa,
        );
      },
    );
  }
}

String getTodayDate() {
  var now = new DateTime.now();
  var formatter = new DateFormat('dd/MM/yyyy');
  return formatter.format(now);
}
