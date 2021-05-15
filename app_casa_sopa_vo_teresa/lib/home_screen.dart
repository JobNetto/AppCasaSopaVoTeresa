import 'package:app_casa_sopa_vo_teresa/doacao_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(100.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xffffa500),
          Color(0xffffbd00),
          Color(0xffffd953),
          Color(0xffffeba6),
          Colors.white,
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/logo.png",
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Fundada em 2013, a instituição conta com a ajuda de voluntários e tem como objetivo principal a distribuição gratuita de sopa que alimenta mais de 100 pessoas semanalmente em Alfenas.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            "A sopa é distribuída para qualquer pessoa, todas as sextas-feiras no endereço da instituição.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            " Rua Ilhéus, 39 - Itaparica. Alfenas-MG.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 260,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoacaoScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                child: Text('AJUDAR')),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  print('Pressed');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xfff6cbe2),
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                child: Text('ENTRAR')),
          ),
        ],
      ),
    );
  }
}
