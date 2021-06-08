import 'package:app_casa_sopa_vo_teresa/data/doacao_data.dart';
import 'package:app_casa_sopa_vo_teresa/models/Doacao.dart';
import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class TodosWidget extends StatelessWidget {
  const TodosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final interesses = {...DOACAO_DATA};
    return Container(
      child: ListView.builder(
        itemCount: interesses.length,
        itemBuilder: (ctx, i) =>  ItemTile(interesses.values.elementAt(i))),
    );
  }
}

class ItemTile extends StatelessWidget {
  
  final Doacao doacao;

  const ItemTile(this.doacao);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(doacao.nome),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('E-mail: ' + doacao.email),
            Text('Celular: ' + doacao.telefone),
            Text(doacao.doacao),
          ],
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: null,
                  color: Colors.yellow,
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: null, color: Colors.red, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
