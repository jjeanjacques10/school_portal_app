import 'package:flutter/material.dart';
import 'package:school_portal_app/components/tarefas_card.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/turma_repository.dart';

class TarefasDetalhesScreen extends StatefulWidget {
  TarefasDetalhesScreen({Key key}) : super(key: key);

  @override
  _TarefasDetalhesScreenState createState() => _TarefasDetalhesScreenState();
}

class _TarefasDetalhesScreenState extends State<TarefasDetalhesScreen> {
  TurmaRepository turmaRepository = TurmaRepository();
  @override
  Widget build(BuildContext context) {
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
                  'Tarefas | 3SIB | 30/05/2020',
                  textAlign: TextAlign.center,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    onPressed: null,
                    child: const Text('Salvar',
                        style: TextStyle(fontSize: 16, color: Colors.white))),
              ),
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
    print(turmas.length);
    return ListView.builder(
      itemCount: turmas == null ? 0 : turmas.length,
      itemBuilder: (BuildContext ctx, int index) {
        TurmaModel turma = turmas[index];

        return TarefasCard(
          nome: turma.nome,
          rm: "",
          foto: "",
          sala: "",
        );
      },
    );
  }
}
