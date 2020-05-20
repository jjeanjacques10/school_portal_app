import 'package:flutter/material.dart';
import 'package:school_portal_app/screens/home_screen.dart';
import 'package:school_portal_app/screens/login_screen.dart';

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
      ),
      home: MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
