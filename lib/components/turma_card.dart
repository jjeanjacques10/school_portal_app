import 'package:flutter/material.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:school_portal_app/screens/chamada_detalhes_screen.dart';
import 'package:school_portal_app/screens/tarefas_detalhes_screen.dart';

class TurmaCard extends StatelessWidget {
  final TurmaModel turmaModel;
  final String tipo;

  const TurmaCard( {
    this.turmaModel,
    this.tipo,
  });

  @override
  Widget build(BuildContext ctx) {
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          title: Text(
            turmaModel.disciplina,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    "${turmaModel.nome} | ${turmaModel.horario} | ${turmaModel.inicio} | ${turmaModel.termino}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            if (tipo == "chamada") {
              Navigator.push(
                ctx,
                new MaterialPageRoute(
                  builder: (context) => ChamadaDetalhesScreen(),
                  settings: RouteSettings(
                    arguments: turmaModel,
                  ),
                ),
              );
            } else {
              Navigator.push(
                  ctx,
                  new MaterialPageRoute(
                      builder: (context) => new TarefasDetalhesScreen()));
            }
          },
        ),
      ),
    );
  }
}
