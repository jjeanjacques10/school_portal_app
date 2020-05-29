import 'package:flutter/material.dart';
import 'package:school_portal_app/models/professor_model.dart';
import 'package:school_portal_app/screens/chamada_screen.dart';
import 'package:school_portal_app/screens/home/home_screen.dart';
import 'package:school_portal_app/screens/tarefas_screen.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  ProfessorModel professorModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Menu superior
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  // Menu de navegação
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    ChamadaScreen(),
    TarefasScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    professorModel = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'FIAPP',
            style: TextStyle(color: Colors.pink),
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
        body: _widgetOptions.elementAt(_selectedIndex),
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.pink[900],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Notificações', icon: Icons.mail),
  const Choice(title: 'Editar Perfil', icon: Icons.edit,),
  const Choice(title: 'Configurações', icon: Icons.settings),
  const Choice(title: 'Avaliar App', icon: Icons.thumb_up),
  const Choice(title: 'Reportar Erro', icon: Icons.textsms),
  const Choice(title: 'Sair', icon: Icons.exit_to_app),
];
