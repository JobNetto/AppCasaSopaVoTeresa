import 'package:app_casa_sopa_vo_teresa/screens/admin/adm_home_screen.dart';
import 'package:app_casa_sopa_vo_teresa/screens/base/doacao_screen.dart';
import 'package:app_casa_sopa_vo_teresa/services/autenticacao_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isProcessing = false;

  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser;
    //...//
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
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
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 110.0),
            Column(
              children: <Widget>[
                TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                SizedBox(height: 24.0),
                _isProcessing
                    ? CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pink[100],
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.red,
                                  elevation: 5,
                                ),
                                child: Text('VOLTAR')),
                          ),
                          SizedBox(width: 25.0),
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    _isProcessing = true;
                                  });

                                  User user =
                                      await AutenticacaoService.signInUsuario(
                                    email: _emailTextController.text,
                                    senha: _passwordTextController.text,
                                  );

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => AdminHomeScreen(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pink,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.red,
                                  elevation: 5,
                                ),
                                child: Text('ENTRAR')),
                          ),
                        ],
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
