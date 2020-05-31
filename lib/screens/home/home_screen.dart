import 'package:flutter/material.dart';
import 'package:school_portal_app/models/professor_model.dart';

class HomeScreen extends StatelessWidget {
  final ProfessorModel professorModel;

  const HomeScreen({
    this.professorModel,
  });


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Text(
                      'Olá, ${professorModel.nome}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
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
                    onTap: () {
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
                        ),
                      ],
                    ),
                    onTap: () {},
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
                        child: Text("Nenhum cadastrado!"),
                      );
                    }
                  } else {
                    return Center(
                        //child: CircularProgressIndicator(),
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
