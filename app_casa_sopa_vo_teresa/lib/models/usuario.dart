class Usuario {
  final String usuarioId;
  final String nome;
  final String email;
  final double celular;
  final String doacao;
  final String interesse;

  Usuario(
      {this.usuarioId,
      this.nome,
      this.email,
      this.celular,
      this.doacao,
      this.interesse});

  Map<String, dynamic> toMap() {
    return {
      'usuarioId': usuarioId,
      'nome': nome,
      'email': email,
      'celular': celular,
      'doacao': doacao,
      'interesse': interesse,
    };
  }

  Usuario.fromFirestore(Map<String, dynamic> firestoredocument)
      : usuarioId = firestoredocument['usuarioId'],
        nome = firestoredocument['nome'],
        email = firestoredocument['email'],
        celular = firestoredocument['celular'],
        doacao = firestoredocument['doacao'],
        interesse = firestoredocument['interesse'];
}
