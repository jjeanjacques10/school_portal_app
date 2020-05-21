import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'FIAPP',
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.w300
            ),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: [
                        Icon(
                          choice.icon,
                          color: Colors.pink,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(choice.title),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Text(
                  'Olá, Flavio!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      "Aulas do dia:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Card(
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
                      "Desenvolvimento Cross Platform",
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
              ),
              Card(
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
                      "Desenvolvimento Cross Platform",
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
                              "3SIR | 19h00 | 302 un. 2",
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pink,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Início',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind),
              title: Text(
                'Chamada',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text(
                'Tarefas',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.pink[900],
          onTap: null,
        ),
      ),
    );
  }

  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Notificações', icon: Icons.mail),
  const Choice(title: 'Editar Perfil', icon: Icons.edit),
  const Choice(title: 'Configurações', icon: Icons.settings),
  const Choice(title: 'Avaliar App', icon: Icons.thumb_up),
  const Choice(title: 'Reportar Erro', icon: Icons.textsms),
  const Choice(title: 'Sair', icon: Icons.exit_to_app),
];
