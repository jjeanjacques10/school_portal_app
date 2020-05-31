import 'package:flutter/material.dart';
import 'package:school_portal_app/components/tarefas_card.dart';
import 'package:school_portal_app/models/tarefas_model.dart';
import 'package:school_portal_app/models/turma_model.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'FIAPP',
            style: TextStyle(color: Colors.pink),
          ),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Tarefas',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    '${turmaModel.disciplina} | ${turmaModel.nome} ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: chamadaList(turmaModel),
              ),
            ),
          ],
        ),
      ),
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
              child: Text(
                "Sem tarefas cadastradas.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
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
