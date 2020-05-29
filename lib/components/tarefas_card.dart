import 'package:flutter/material.dart';

class TarefasCard extends StatefulWidget {
  final String nome;
  final String rm;
  final String foto;
  final String sala;

  const TarefasCard({
    this.nome,
    this.rm,
    this.foto,
    this.sala,
  });

  @override
  _TarefasCardState createState() => _TarefasCardState();
}

class _TarefasCardState extends State<TarefasCard> {
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
          leading: Image.network(widget.foto),
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
          trailing: Container(
            width: 30.0,
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(
                fontSize: 20.0,
                height: 2.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
