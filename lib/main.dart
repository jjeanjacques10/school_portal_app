import 'package:flutter/material.dart';
import 'package:school_portal_app/screens/chamada_detalhes_screen.dart';
import 'package:school_portal_app/screens/chamada_screen.dart';
import 'package:school_portal_app/screens/home_screen.dart';
import 'package:school_portal_app/screens/login_screen.dart';
import 'package:school_portal_app/screens/menu_screen.dart';
import 'package:school_portal_app/screens/professor/editar_professor.dart';
import 'package:school_portal_app/screens/professor/novo_professor.dart';
import 'package:school_portal_app/screens/tarefas_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FIAP - Professor',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Montserrat',
      ),
      home: MaterialApp(
        initialRoute: '/menu',
        routes: {
          '/login': (context) => LoginScreen(),
          '/menu': (context) => MenuScreen(),
          '/home': (context) => HomeScreen(),
          '/tarefas': (context) => TarefasScreen(),
          //'/tarefas-detalhes': (context) => TarefasDetalhesScreen(),
          '/chamada': (context) => ChamadaScreen(),
          '/chamada-detalhes': (context) => ChamadaDetalhesScreen(),
          '/novo-professor': (context) => NovoProfessorScreen(),
          '/editar-profesor': (context) => EditarProfessorScreen(),
        },
      ),
    );
  }
}
