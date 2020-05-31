import 'package:flutter/material.dart';
import 'package:school_portal_app/components/tarefas_card.dart';
import 'package:school_portal_app/models/tarefas_aluno.dart';
import 'package:school_portal_app/models/tarefas_model.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/turma_repository.dart';
import 'package:school_portal_app/repository/tarefas_repository.dart';

class TarefasDetalhesScreen extends StatefulWidget {
  TarefasDetalhesScreen({Key key}) : super(key: key);

  @override
  _TarefasDetalhesScreenState createState() => _TarefasDetalhesScreenState();
}

class _TarefasDetalhesScreenState extends State<TarefasDetalhesScreen> {
  TarefasRepository tarefasRepository = TarefasRepository();
  TurmaModel turmaModel;

  @override
  Widget build(BuildContext context) {
    turmaModel = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Text(
                  'Tarefas | ${turmaModel.nome} | 30/05/2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                  child: SizedBox(
                child: tarefasList(turmaModel),
              )),
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.white))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                        onPressed: null,
                        color: Colors.grey,
                        child: const Text('Salvar',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tarefasList(TurmaModel turmaModel) {
    return FutureBuilder<List>(
      future: tarefasRepository.findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length > 0) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: Text("Nenhuma tarefas cadastradas!"),
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
