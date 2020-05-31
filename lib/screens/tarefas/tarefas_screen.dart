import 'package:flutter/material.dart';
import 'package:school_portal_app/components/turma_card.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/turma_repository.dart';
import 'package:school_portal_app/screens/tarefas/cadastro_tarefas_screen.dart';

class TarefasScreen extends StatefulWidget {
  TarefasScreen({Key key}) : super(key: key);

  @override
  _TarefasScreenState createState() => _TarefasScreenState();
}

class _TarefasScreenState extends State<TarefasScreen> {
  TurmaRepository turmaRepository = TurmaRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CadastroTarefasScreen()),
                      );
                    },
                    color: Colors.grey,
                    child: const Text('Adicionar nova tarefa',
                        style: TextStyle(fontSize: 16, color: Colors.white))),
              ),
              Expanded(
                  child: SizedBox(
                child: futuro(),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget futuro() {
    return FutureBuilder<List>(
      future: turmaRepository.findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length > 0) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: Text("Nenhum curso cadastrado!"),
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

  ListView buildListView(List<TurmaModel> turmas) {
    return ListView.builder(
      itemCount: turmas == null ? 0 : turmas.length,
      itemBuilder: (BuildContext ctx, int index) {
        TurmaModel turma = turmas[index];

        return TurmaCard(
          turmaModel: turma,
          tipo: 'tarefas',
        );
      },
    );
  }
}
