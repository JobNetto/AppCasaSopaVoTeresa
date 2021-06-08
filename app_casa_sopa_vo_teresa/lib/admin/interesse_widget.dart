import 'package:app_casa_sopa_vo_teresa/data/interessados_data.dart';
import 'package:app_casa_sopa_vo_teresa/models/Doacao.dart';
import 'package:app_casa_sopa_vo_teresa/models/Interessado.dart';
import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class InteresseWidget extends StatelessWidget {
  const InteresseWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final interesses = {...INTERESSADOS_DATA};
    return Container(
      child: ListView.builder(
        itemCount: interesses.length,
        itemBuilder: (ctx, i) =>  ItemTile(interesses.values.elementAt(i))),
    );
  }
}

class ItemTile extends StatelessWidget {
  
  final Interessado interessado;

  const ItemTile(this.interessado);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(interessado.nome),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('E-mail: ' + interessado.email),
            Text('Celular: ' + interessado.telefone),
            Text(interessado.interesse),
          ],
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              ElevatedButton(onPressed: () => {}, child: Text('OK'))
            ],
          ),
        ),
      ),
    );
  }
}


// ListView(
//       children: <Widget>[
//         ItemTile(),
//         ItemTile(),
//         ItemTile(),
//         ItemTile(),
//       ],
//     );