import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:app_casa_sopa_vo_teresa/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class UsuarioModel extends ChangeNotifier {
  final firestoreservice = FirestoreService();

  String _usuarioId;
  String _nome;
  String _email;
  int _celular;
  var uuid = Uuid();

  //GETTERS AND SETTERS
  String get nome => _nome;
  String get email => _email;
  int get celular => _celular;

  setNome(String xnome) {
    _nome = xnome;
    notifyListeners();
  }

  setEmail(String xemail) {
    _email = xemail;
    notifyListeners();
  }

  setCelular(String xcecular) {
    _celular = int.parse(xcecular);
    notifyListeners();
  }

  loadProduto(Usuario usuario) {
    _nome = usuario.nome;
    _email = usuario.email;
    _celular = usuario.celular;
    _usuarioId = usuario.usuarioId;
  }

  createUsuario() {
    //CREATE
    if (_usuarioId == null) {
      var novoUsuario = Usuario(
          nome: nome, email: email, celular: celular, usuarioId: uuid.v4());
      firestoreservice.createUsuario(novoUsuario);
    } else {
      //UPDATE
      var alteraUsuario = Usuario(
          nome: nome, celular: celular, email: email, usuarioId: _usuarioId);
      firestoreservice.createUsuario(alteraUsuario);
    }
  }

  removeUsuario(String usuarioId) {
    firestoreservice.removeUsuario(usuarioId);
  }
}
