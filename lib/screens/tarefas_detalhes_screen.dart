import 'package:flutter/material.dart';
import 'package:school_portal_app/components/tarefas_card.dart';

class TarefasDetalhesScreen extends StatefulWidget {
  TarefasDetalhesScreen({Key key}) : super(key: key);

  @override
  _TarefasDetalhesScreenState createState() => _TarefasDetalhesScreenState();
}

class _TarefasDetalhesScreenState extends State<TarefasDetalhesScreen> {
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
              TarefasCard(
                  'Vitor Rico',
                  'RM80515',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              TarefasCard(
                  'Gabriel Petillo',
                  'RM81238',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              TarefasCard(
                  'Jean Jacques',
                  'RM80515',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              TarefasCard(
                  'Vinicius Mota',
                  'RM81238',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              TarefasCard(
                  'Gabriel Petillo',
                  'RM81238',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              TarefasCard(
                  'Jean Jacques',
                  'RM80515',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              TarefasCard(
                  'Vinicius Mota',
                  'RM81238',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    onPressed: null,
                    child: const Text('Salvar',
                        style: TextStyle(fontSize: 16, color: Colors.white))),
              ),
              SizedBox(height: 24),
              FutureBuilder<List>(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data.length > 0) {
                      return Text(snapshot.data.toString());
                    } else {
                      return Center(
                        child: Text("Nenhum curso cadastrado!"),
                      );
                    }
                  } else {
                    return Center(
                        // child: CircularProgressIndicator(),
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
