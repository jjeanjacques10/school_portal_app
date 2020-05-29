import 'package:flutter/material.dart';

class ChamadaCard extends StatefulWidget {
  final String nome;
  final String rm;
  final String foto;
  final String sala;

  const ChamadaCard(
    this.nome,
    this.rm,
    this.foto,
    this.sala,
  );

  @override
  _ChamadaCardState createState() => _ChamadaCardState();
}

class _ChamadaCardState extends State<ChamadaCard> {
  bool isChecked = false;

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
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.network(
              widget.foto,
            ),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          title: Text(
            widget.nome,
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
                    "${widget.rm}",
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
                setState(() {
                  isChecked = newValue;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.pink),
          onTap: () {
            //navegarTelaCursoDetalhes(context, curso);
          },
        ),
      ),
    );
  }
}
