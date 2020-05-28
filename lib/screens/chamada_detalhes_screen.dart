import 'package:flutter/material.dart';
import 'package:school_portal_app/components/chamada_card.dart';

class ChamadaDetalhesScreen extends StatefulWidget {
  ChamadaDetalhesScreen({Key key}) : super(key: key);

  @override
  _ChamadaDetalhesScreenState createState() => _ChamadaDetalhesScreenState();
}

class _ChamadaDetalhesScreenState extends State<ChamadaDetalhesScreen> {
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
                  'Chamada | 3SIB | 30/05/2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ChamadaCard(
                  'Vitor Rico',
                  'RM80515',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              ChamadaCard(
                  'Gabriel Petillo',
                  'RM81238',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              ChamadaCard(
                  'Jean Jacques',
                  'RM80515',
                  'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                  '3SIB'),
              ChamadaCard(
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
