import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cripto_provider.dart';
import '../widgets/cripto_bloco.dart';

class FavoritosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final criptoProvider = Provider.of<CriptoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: ListView.builder(
        itemCount: criptoProvider.favoritos.length,
        itemBuilder: (context, index) {
          return CriptoBloco(cripto: criptoProvider.favoritos[index]);
        },
      ),
    );
  }
}
