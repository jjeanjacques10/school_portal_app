import 'package:flutter/material.dart';
import 'package:school_portal_app/components/choice_menu.dart';
import 'package:school_portal_app/models/professor_model.dart';
import 'package:school_portal_app/screens/chamada/chamada_screen.dart';
import 'package:school_portal_app/screens/home/home_screen.dart';
import 'package:school_portal_app/screens/tarefas/tarefas_screen.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  ProfessorModel professorModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Menu superior
  ChoiceMenu _selectedChoice = choices[0];

  void _select(ChoiceMenu choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Menu de navegação
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    professorModel = ModalRoute.of(context).settings.arguments;
    final List<Widget> _widgetOptions = [
      HomeScreen(
        professorModel: professorModel,
      ),
      ChamadaScreen(
        ctx: context,
      ),
      TarefasScreen(
        ctx: context,
      )
    ];
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
            PopupMenuButton<ChoiceMenu>(
              onSelected: _select,
              itemBuilder: (BuildContext ctx) {
                return choices.map((ChoiceMenu choice) {
                  return PopupMenuItem<ChoiceMenu>(
                    enabled: choice.enabled,
                    value: choice,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (choice.route == '/edicao-professor') {
                                Navigator.pushNamed(
                                  context,
                                  choice.route,
                                  arguments: professorModel,
                                );
                              } else {
                                Navigator.pushNamed(context, choice.route);
                              }
                            },
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
                            ))
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

const List<ChoiceMenu> choices = const <ChoiceMenu>[
  const ChoiceMenu(title: 'Notificações', icon: Icons.mail, enabled: false),
  const ChoiceMenu(
      title: 'Editar Perfil',
      icon: Icons.edit,
      enabled: true,
      route: '/edicao-professor'),
  const ChoiceMenu(
      title: 'Configurações', icon: Icons.settings, enabled: false),
  const ChoiceMenu(title: 'Reportar Erro', icon: Icons.textsms, enabled: false),
  const ChoiceMenu(
      title: 'Sair', icon: Icons.exit_to_app, enabled: true, route: '/login'),
];
