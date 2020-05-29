import 'package:flutter/material.dart';
import 'package:school_portal_app/components/chamada_card.dart';

class ChamadaDetalhesScreen extends StatefulWidget {
  ChamadaDetalhesScreen({Key key}) : super(key: key);

  @override
  _ChamadaDetalhesScreenState createState() => _ChamadaDetalhesScreenState();
}

class _ChamadaDetalhesScreenState extends State<ChamadaDetalhesScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
              Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: <Widget>[
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                                onPressed: (null),
                                color: Colors.grey,
                                child: const Text('Salvar',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white))),
                          ),
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          child: Text(
                            "Salvar",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();

                              //CursoRepository().createRaw(cursoModel);
                              //CursoService().create(cursoModel);
                              print("asjkndfkasjdnhjdnasjdbjasbdasjlbd");
                              var mensagem = ' cadastrado com sucesso!';

                              Navigator.pop(
                                context,
                                mensagem,
                              );
                            } else {
                              scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Não foi possível gravar o curso.',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
