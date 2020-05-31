import 'package:flutter/material.dart';
import 'package:school_portal_app/components/turma_card.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/turma_repository.dart';

class ChamadaScreen extends StatelessWidget {
  final BuildContext ctx;

  ChamadaScreen({
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
                        Icons.assignment_ind,
                        color: Colors.pink,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Chamada',
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
      itemBuilder: (BuildContext context, int index) {
        TurmaModel turma = turmas[index];

        return TurmaCard(
          ctx: ctx,
          turmaModel: turma,
          route: '/chamada-detalhes',
        );
      },
    );
  }
}
