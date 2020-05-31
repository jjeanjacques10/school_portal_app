import 'package:flutter/material.dart';
import 'package:school_portal_app/models/tarefas_model.dart';

class TarefasCard extends StatefulWidget {
  final TarefasModel tarefa;

  const TarefasCard({
    this.tarefa,
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          title: Text(
            '${widget.tarefa.tipo} ${widget.tarefa.titulo}',
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
                    "${widget.tarefa.data}",
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
            width: 40.0,
            child: TextField(              
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              style: TextStyle(
                fontSize: 20.0,
                height: 1.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
