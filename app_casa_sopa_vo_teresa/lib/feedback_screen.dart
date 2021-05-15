import 'package:app_casa_sopa_vo_teresa/doacao_screen.dart';
import 'package:app_casa_sopa_vo_teresa/home_screen.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({
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
            "As familias beneficiadas agradecem a sua doação.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "OBRIGADO!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Text(
            'Aguarde nosso contato!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            width: 260,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                child: Text('VOLTAR')),
          ),
        ],
      ),
    );
  }
}
