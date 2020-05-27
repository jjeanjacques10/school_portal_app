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
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Text(
                  'Chamada - 3SIB',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ChamadaCard('Vitor Rico', 'RM80515', 'https://avatars2.githubusercontent.com/u/61835701?s=460&u=2b206f28207efe977c6629138b8fd9addd1abc7f&v=4', '3SIB'),
              ChamadaCard('Gabriel Petillo', 'RM81238', 'https://scontent.fcgh16-1.fna.fbcdn.net/v/t1.0-9/s960x960/77151667_2544018252378842_504437475054190592_o.jpg?_nc_cat=101&_nc_sid=13bebb&_nc_oc=AQkUWt4ULhiKqbKMW2mFhkXvuffGj1L4x72Ds2HZfV15LY_Yv8QWToL8I7k3y44sMh0&_nc_ht=scontent.fcgh16-1.fna&_nc_tp=7&oh=acca3315fee5e50c8eca5e561b0b7a2d&oe=5EF2C1F0', '3SIB'),
              ChamadaCard('Jean Jacques', 'RM80515', 'https://avatars3.githubusercontent.com/u/32225403?s=460&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4', '3SIB'),
              ChamadaCard('Vinicius Mota', 'RM81238', 'https://scontent-gru2-2.xx.fbcdn.net/v/t31.0-8/1401524_1384989771747192_1385907595_o.jpg?_nc_cat=100&_nc_sid=174925&_nc_ohc=COB4pK-td2QAX9rhd6v&_nc_ht=scontent-gru2-2.xx&oh=2f8c117b9a5ee647d4f6f6ea90c8b391&oe=5EF2BD7F', '3SIB'),
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
