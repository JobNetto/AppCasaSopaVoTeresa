class Interessado {
  final String id;
  final String nome;
  final String telefone;
  final String email;
  final String interesse;

  Interessado({
    this.id,
    this.nome,
    this.telefone,
    this.email,
    this.interesse,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'telefone': telefone, 'email': email, 'interesse': interesse };
  }

  Interessado.fromFirestore(Map<String, dynamic> firestoredocument)
      : id = firestoredocument['id'],
        nome = firestoredocument['nome'],
        telefone = firestoredocument['telefone'],
        email = firestoredocument['email'],
        interesse = firestoredocument['interesse']
        ;
}
