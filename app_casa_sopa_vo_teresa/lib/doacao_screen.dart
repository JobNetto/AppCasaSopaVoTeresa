import 'feedback_screen.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';

class DoacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffa500),
        title: Text(
          'Casa da Sopa Vó Teresa',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Marque sua opção de doação',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Text('ALIMENTO'),
                  padding: EdgeInsets.all(30),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Column(
                    children: [
                      Text('SER'),
                      Text('VOLUNTÁRIO'),
                    ],
                  ),
                  padding: EdgeInsets.all(27.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Text('DINHEIRO'),
                  padding: EdgeInsets.all(30.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '_____________________________________________________________',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Text('Queremos saber quem é você,',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(
                  'conte pra gente!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 300,
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(hintText: 'Nome completo'),
                )),
            SizedBox(
                width: 300,
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(hintText: 'E-mail'),
                )),
            SizedBox(
                width: 300,
                child: TextField(
                  autofocus: false,
                  decoration:
                      InputDecoration(hintText: 'Celular (DDD + número)'),
                )),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 260,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                    shadowColor: Colors.red,
                    elevation: 5,
                  ),
                  child: Text('CONFIRMAR')),
            ),
          ],
        ),
      ),
    );
  }
}
