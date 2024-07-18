import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cripto_provider.dart';
import 'screens/home_tela.dart';
import 'screens/favoritos_tela.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CriptoProvider(),
      child: MaterialApp(
        title: 'Cripto App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeTela(),
        routes: {
          '/favoritos': (context) => FavoritosScreen(),
        },
      ),
    );
  }
}
