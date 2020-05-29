import 'package:flutter/material.dart';
import 'package:school_portal_app/screens/chamada_detalhes_screen.dart';
import 'package:school_portal_app/screens/tarefas_detalhes_screen.dart';

class TurmaCard extends StatelessWidget {
  final int id;
  final String nome;
  final String disciplina;
  final String horario;
  final String inicio;
  final String termino;
  final String rota;

  const TurmaCard(
    BuildContext context, {
    this.id,
    this.nome,
    this.disciplina,
    this.horario,
    this.inicio,
    this.termino,
    this.rota,
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
            disciplina,
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
                    "${nome} | ${horario} | ${inicio} | ${termino}",
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
            if (rota == "/chamada-detalhes") {
              Navigator.push(
                  ctx,
                  new MaterialPageRoute(
                      builder: (context) => new ChamadaDetalhesScreen()));
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
