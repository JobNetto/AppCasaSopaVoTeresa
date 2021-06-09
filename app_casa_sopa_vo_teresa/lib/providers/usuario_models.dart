import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:app_casa_sopa_vo_teresa/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class UsuarioModel extends ChangeNotifier {
  final firestoreservice = FirestoreService();

  String _usuarioId;
  String _nome;
  String _email;
  double _celular;
  String _doacao;
  String _interesse;
  var uuid = Uuid();

  //GETTERS AND SETTERS
  String get nome => _nome;
  String get email => _email;
  double get celular => _celular;
  String get doacao => _doacao;
  String get interesse => _interesse;

  setNome(String xnome) {
    _nome = xnome;
    notifyListeners();
  }

  setEmail(String xemail) {
    _email = xemail;
    notifyListeners();
  }

  setCelular(String xcelular) {
    _celular = double.parse(xcelular);
    notifyListeners();
  }

  setDoacao(String xdoacao) {
    _doacao = xdoacao;
    notifyListeners();
  }

  setInteresse(String xinteresse) {
    _interesse = xinteresse;
    notifyListeners();
  }

  loadUsuario(Usuario usuario) {
    _nome = usuario.nome;
    _email = usuario.email;
    _celular = usuario.celular;
    _doacao = usuario.doacao;
    _interesse = usuario.interesse;
    _usuarioId = usuario.usuarioId;
  }

  saveUsuario() {
    //CREATE
    if (_usuarioId == null) {
      var novoUsuario = Usuario(
          nome: nome,
          email: email,
          celular: celular,
          interesse: interesse,
          usuarioId: uuid.v4());
      firestoreservice.saveUsuario(novoUsuario);
    } else {
      //UPDATE
      var alteraUsuario = Usuario(
          nome: nome,
          email: email,
          celular: celular,
          interesse: interesse,
          usuarioId: _usuarioId);
      firestoreservice.saveUsuario(alteraUsuario);
    }
  }

  removeUsuario(String usuarioId) {
    firestoreservice.removeUsuario(usuarioId);
  }
}
