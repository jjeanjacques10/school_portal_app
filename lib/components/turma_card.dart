import 'package:flutter/material.dart';

class TurmaCard extends StatelessWidget {
  final String nome;
  final String disciplina;
  final String horario;
  final String inicio;
  final String termino;

  const TurmaCard(
    this.nome,
    this.disciplina,
    this.horario,
    this.inicio,
    this.termino,
  );

  @override
  Widget build(BuildContext context) {
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
            nome,
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
                    "3SIA | 10h00 | 504 un. 2",
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
            //navegarTelaCursoDetalhes(context, curso);
          },
        ),
      ),
    );
  }
}
