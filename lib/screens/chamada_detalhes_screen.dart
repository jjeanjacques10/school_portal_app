import 'package:flutter/material.dart';
import 'package:school_portal_app/components/chamada_card.dart';
import 'package:school_portal_app/models/chamada_aluno.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/repository/chamada_aluno_repository.dart';
import 'package:intl/intl.dart';

class ChamadaDetalhesScreen extends StatefulWidget {
  ChamadaDetalhesScreen({Key key}) : super(key: key);

  @override
  _ChamadaDetalhesScreenState createState() => _ChamadaDetalhesScreenState();
}

class _ChamadaDetalhesScreenState extends State<ChamadaDetalhesScreen> {
  ChamadaAlunoRepository chamadaAlunoRepository = new ChamadaAlunoRepository();
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
                    '${turmaModel.disciplina} | ${turmaModel.nome} | ${getTodayDate()}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: ChamadaList(turmaModel),
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

  Widget ChamadaList(TurmaModel turmaModel) {
    return FutureBuilder<List>(
      future: chamadaAlunoRepository.findChamadaTurma(turmaModel.nome),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length > 0) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: Text("Nenhum aluno cadastrado!"),
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

  ListView buildListView(List<ChamadaAluno> alunos) {
    return ListView.builder(
      itemCount: alunos == null ? 0 : alunos.length,
      itemBuilder: (BuildContext ctx, int index) {
        ChamadaAluno aluno = alunos[index];

        return ChamadaCard(
          aluno,
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
