import 'package:flutter/material.dart';
import 'package:school_portal_app/models/chamada_aluno.dart';
import 'package:school_portal_app/repository/chamada_aluno_repository.dart';

class ChamadaCard extends StatefulWidget {
  final ChamadaAluno chamadaAluno;

  const ChamadaCard(
    this.chamadaAluno,
  );

  @override
  _ChamadaCardState createState() => _ChamadaCardState();
}

class _ChamadaCardState extends State<ChamadaCard> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    bool presente = widget.chamadaAluno.presente == 1;
    print(widget.chamadaAluno.presente);
    isChecked = presente;
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: ListTile(
                  leading: Image.network(widget.chamadaAluno.foto),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  title: Text(
                    widget.chamadaAluno.nome,
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
                            "${widget.chamadaAluno.rmAluno} | ${widget.chamadaAluno.turma}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  trailing: Checkbox(
                      value: isChecked,
                      onChanged: (bool newValue) {
                        ChamadaAlunoRepository chamadaAlunoRepository =
                            new ChamadaAlunoRepository();
                        widget.chamadaAluno.presente =
                            newValue == false ? 0 : 1;

                        chamadaAlunoRepository.update(widget.chamadaAluno);

                        setState(() {
                          isChecked = newValue;
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.pink),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
