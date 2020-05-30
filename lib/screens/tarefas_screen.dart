import 'package:flutter/material.dart';
import 'package:school_portal_app/components/turma_card.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/turma_repository.dart';

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
            //return ItemCard('Desenvolvimento Cross Platform', '3SIA','11:40', '304 un. 2');
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
          context,
          id: turma.id,
          nome: turma.nome,
          disciplina: turma.disciplina,
          horario: turma.horario,
          inicio: turma.inicio,
          termino: turma.termino,
          rota: '/tarefas-detalhes',
        );
      },
    );
  }
}
