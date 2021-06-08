import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyStatefulWidget(),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                child: TextField(
              autofocus: false,
              decoration: InputDecoration(hintText: 'Nome'),
            )),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                child: TextField(
              autofocus: false,
              decoration: InputDecoration(hintText: 'E-mail'),
            )),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                child: TextField(
              autofocus: false,
              decoration: InputDecoration(hintText: 'Celular'),
            )),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                child: TextField(
              autofocus: false,
              decoration: InputDecoration(hintText: 'Descrição'),
            )),
            SizedBox(
              height: 125,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => null),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                    shadowColor: Colors.red,
                    elevation: 5,
                  ),
                  child: Text('SALVAR')),
            ),
          ],
        ));
  }
}

enum TipoEnum { doador, beneficiado }

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TipoEnum _character = TipoEnum.doador;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Doador'),
          leading: Radio<TipoEnum>(
            value: TipoEnum.doador,
            groupValue: _character,
            onChanged: (TipoEnum value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Beneficiado'),
          leading: Radio<TipoEnum>(
            value: TipoEnum.beneficiado,
            groupValue: _character,
            onChanged: (TipoEnum value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
