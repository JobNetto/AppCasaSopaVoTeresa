import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:app_casa_sopa_vo_teresa/providers/usuario_models.dart';
import 'package:app_casa_sopa_vo_teresa/screens/admin/adm_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroScreen extends StatefulWidget {
  final Usuario usuario;

  CadastroScreen([this.usuario]); //construtor

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
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
      interessecontroller.text = "NAO";

      final usuarioprovider = Provider.of<UsuarioModel>(context, listen: false);
      usuarioprovider.loadUsuario(Usuario());
    } else {
      nomecontroller.text = widget.usuario.nome;
      emailcontroller.text = widget.usuario.email;
      celularcontroller.text = widget.usuario.celular.toString();
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
      body: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyStatefulWidget(),
              SizedBox(height: 35),
              TextField(
                controller: nomecontroller,
                decoration: InputDecoration(hintText: 'Nome'),
                onChanged: (value) => {usuarioprovider.setNome(value)},
              ),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: 'E-mail'),
                onChanged: (value) => {usuarioprovider.setEmail(value)},
              ),
              TextField(
                controller: celularcontroller,
                decoration: InputDecoration(hintText: 'Celular'),
                onChanged: (value) => {usuarioprovider.setCelular(value)},
              ),
              TextField(
                controller: doacaocontroller,
                decoration: InputDecoration(hintText: 'Doação'),
                onChanged: (value) => {usuarioprovider.setDoacao(value)},
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      usuarioprovider.saveUsuario();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminHomeScreen()));
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
          )),
    );
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
