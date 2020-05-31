import 'package:flutter/material.dart';
import 'package:school_portal_app/components/choice_menu.dart';

class AppBarMenu extends StatefulWidget {
  AppBarMenu({Key key}) : super(key: key);

  @override
  _AppBarMenuState createState() => _AppBarMenuState();
}

class _AppBarMenuState extends State<AppBarMenu> {
  // Menu superior
  ChoiceMenu _selectedChoice = choices[0];

  void _select(ChoiceMenu choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  AppBar build(BuildContext context) {
    return AppBar(
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
