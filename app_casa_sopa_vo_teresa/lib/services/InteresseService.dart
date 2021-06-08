//É A CONEXÃO ENTRE AS CLASSES COM O BANCO DE DADOS ("É O MEIO DO CAMINHO")
import 'package:app_casa_sopa_vo_teresa/models/Interessado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // ADICIONAR OU ALTERAR
  Future<void> saveInteressado(Interessado interessado) {
    return _db
        .collection(
            'interessados') //EM QUAL COLEÇÃO VOU QUERER ALTERAR, NO CASO 'interessados'
        .doc(interessado.id) //EM QUAL DOCUMENTO EU QUERO ALTERAR
        .set(interessado.toMap()); // O MÉTODO toMap(); veio da classe Interessado
  }

  // REMOVER
  Future<void> remove(String interessadoId) {
    return _db.collection('interessados').doc(interessadoId).delete();
  }

  //CONSULTAR
  Stream<List<Interessado>> getInteressados() {
    return _db.collection('interessados').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Interessado.fromFirestore(document.data()))
        .toList());
  }
}
