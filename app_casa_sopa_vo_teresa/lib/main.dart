import 'package:app_casa_sopa_vo_teresa/home_screen.dart';
import 'package:app_casa_sopa_vo_teresa/providers/usuario_models.dart';
import 'package:app_casa_sopa_vo_teresa/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreservice = FirestoreService();

    //gerencia o estado de todo o app com o provider estanciado no inicio da aplicação.
    //diponibilizar os estados do provider para todo o app, em qualquer tela
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsuarioModel()),
        StreamProvider(create: (context) => firestoreservice.getUsuarios()),
      ],
      child: MaterialApp(
        title: 'Casa da Sopa Vó Teresa',
        home: HomeScreen(),
      ),
    );
  }
}
