import 'package:flutter/material.dart';
import 'package:school_portal_app/components/turma_card.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/turma_repository.dart';
import 'package:school_portal_app/screens/tarefas/cadastro_tarefas_screen.dart';

class TarefasScreen extends StatelessWidget {
  final BuildContext ctx;

  TarefasScreen({
    this.ctx,
  });

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
                padding: const EdgeInsets.only(top: 30, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.library_books,
                        color: Colors.pink,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Tarefas',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: futuro(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroTarefasScreen()),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.pinkAccent[700]),
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
      itemBuilder: (BuildContext context, int index) {
        TurmaModel turma = turmas[index];

        return TurmaCard(
          ctx: ctx,
          turmaModel: turma,
          route: '/tarefas-detalhes',
        );
      },
    );
  }
}
