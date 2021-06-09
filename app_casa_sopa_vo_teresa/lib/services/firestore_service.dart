import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

//_____________________USUARIO________________________//

  // ADICIONAR OU ALTERAR
  Future<void> saveUsuario(Usuario usuario) {
    return _db
        .collection(
            'usuarios') //EM QUAL COLEÇÃO VOU QUERER ALTERAR, NO CASO 'usuario'
        .doc(usuario.usuarioId) //EM QUAL DOCUMENTO EU QUERO ALTERAR
        .set(usuario.toMap()); // O MÉTODO toMap(); veio da classe usuario
  }

  // REMOVER
  Future<void> removeUsuario(String usuarioId) {
    return _db.collection('usuarios').doc(usuarioId).delete();
  }

  //CONSULTAR
  Stream<List<Usuario>> getUsuarios() {
    return _db.collection('usuarios').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Usuario.fromFirestore(document.data()))
        .toList());
  }
}
