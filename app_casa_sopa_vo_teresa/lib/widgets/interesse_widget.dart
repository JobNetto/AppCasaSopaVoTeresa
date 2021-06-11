import 'package:app_casa_sopa_vo_teresa/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is the stateless widget that the main application instantiates.
class InteresseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarios1 = Provider.of<List<Usuario>>(context);
    final usuarios =
        usuarios1.where((usuario) => usuario.interesse == 'SIM').toList();

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
                            onPressed: null,
                            color: Colors.yellow,
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              /* 
                              usuarioprovider
                                  .removeUsuario(widget.usuario.usuarioId);
                              Navigator.of(context).pop(); */
                            },
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
