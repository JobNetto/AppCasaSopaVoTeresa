import 'package:app_casa_sopa_vo_teresa/models/Doacao.dart';
import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is the stateless widget that the main application instantiates.
class TodosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<List<Usuario>>(context);

    return Scaffold(
      body: (usuarios != null)
          ? ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(usuarios[index].nome),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Celular: ' + usuarios[index].celular.toString()),
                      //Text(doacao.doacao),
                    ],
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            color: Colors.yellow,
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {},
                            color: Colors.red,
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
