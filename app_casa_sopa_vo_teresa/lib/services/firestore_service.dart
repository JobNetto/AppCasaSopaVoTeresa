import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //CRUD
  //criar - atualizar
  Future<void> createUsuario(Usuario usuario) {
    return _db
        .collection('usuario')
        .doc(usuario.usuarioId)
        .set(usuario.toMap());
  }

  //ler-consultar
  Stream<List<Usuario>> getUsuarios() {
    return _db.collection('usuarios').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Usuario.fromFirestore(document.data()))
        .toList());
  }

  //remover
  Future<void> removeUsuario(String usuarioId) {
    return _db.collection('produtos').doc(usuarioId).delete();
  }
}
