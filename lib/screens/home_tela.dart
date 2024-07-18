import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cripto_provider.dart';
import '../widgets/cripto_bloco.dart';

class HomeTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final criptoProvider = Provider.of<CriptoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cripto Mundo'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.pushNamed(context, '/favoritos');
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: criptoProvider.fetchCriptos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: criptoProvider.criptos.length,
            itemBuilder: (context, index) {
              return CriptoBloco(cripto: criptoProvider.criptos[index]);
            },
          );
        },
      ),
    );
  }
}
