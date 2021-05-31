class Usuario {
  final String usuarioId;
  final String nome;
  final String email;
  final int celular;

  Usuario({this.usuarioId, this.nome, this.email, this.celular});

  Map<String, dynamic> toMap() {
    return {
      'produtoId': usuarioId,
      'nome': nome,
      'email': email,
      'celular': celular
    };
  }

  Usuario.fromFirestore(Map<String, dynamic> firestoredocument)
      : usuarioId = firestoredocument['usuarioId'],
        nome = firestoredocument['nome'],
        email = firestoredocument['email'],
        celular = firestoredocument['celular'];
}
