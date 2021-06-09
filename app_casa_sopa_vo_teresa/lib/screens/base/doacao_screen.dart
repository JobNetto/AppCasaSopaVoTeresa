import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:app_casa_sopa_vo_teresa/providers/usuario_models.dart';
import 'package:provider/provider.dart';

import 'feedback_screen.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
class DoacaoScreen extends StatefulWidget {
  final Usuario usuario;

  DoacaoScreen([this.usuario]); //construtor

  @override
  _DoacaoScreenState createState() => _DoacaoScreenState();
}

class _DoacaoScreenState extends State<DoacaoScreen> {
  //controladores
  final nomecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final celularcontroller = TextEditingController();
  final doacaocontroller = TextEditingController();
  final interessecontroller = TextEditingController();

  //SERVE PARA VERIFICAR SE ESTÁ VINDO ALGUMA COISA DO CONSTRUTOR OU NÃO
  //PARA SABER SE VAI CRIAR UM PRODUTO OU ALTERAR O PRODUTO EXISTENTE
  @override
  void initState() {
    if (widget.usuario == null) {
      nomecontroller.text = "";
      emailcontroller.text = "";
      celularcontroller.text = "";
      doacaocontroller.text = "";
      interessecontroller.text = "SIM"; // para pesquisar apenas interessados

      final usuarioprovider = Provider.of<UsuarioModel>(context, listen: false);
      usuarioprovider.loadUsuario(Usuario());
    } else {
      nomecontroller.text = widget.usuario.nome;
      emailcontroller.text = widget.usuario.email;
      celularcontroller.text = widget.usuario.celular.toString();
      doacaocontroller.text = widget.usuario.doacao;
      interessecontroller.text = widget.usuario.interesse;

      final usuarioprovider = Provider.of<UsuarioModel>(context, listen: false);
      usuarioprovider.loadUsuario(widget.usuario);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usuarioprovider = Provider.of<UsuarioModel>(context);
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
                  elevation: 3.0,
                  fillColor: Colors.white,
                  child: Text('ALIMENTO'),
                  padding: EdgeInsets.all(30),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 3.0,
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
                  elevation: 3.0,
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
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text(
                  'conte pra gente!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: nomecontroller,
                  decoration: InputDecoration(hintText: 'Nome completo'),
                  onChanged: (value) => {usuarioprovider.setNome(value)},
                )),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value) => {usuarioprovider.setEmail(value)},
                )),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: celularcontroller,
                  decoration:
                      InputDecoration(hintText: 'Celular (DDD + número)'),
                  onChanged: (value) => {usuarioprovider.setCelular(value)},
                )),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 260,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    usuarioprovider.saveUsuario();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedbackScreen()));
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
