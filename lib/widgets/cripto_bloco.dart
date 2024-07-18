import 'package:flutter/material.dart';
import '../models/cripto.dart';
import '../providers/cripto_provider.dart';
import 'package:provider/provider.dart';

class CriptoBloco extends StatelessWidget {
  final Cripto cripto;

  CriptoBloco({required this.cripto});

  @override
  Widget build(BuildContext context) {
    final criptoProvider = Provider.of<CriptoProvider>(context);

    return ListTile(
      title: Text(cripto.name),
      subtitle: Text('\$${cripto.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(
          criptoProvider.favoritos.contains(cripto)
              ? Icons.star
              : Icons.star_border,
          color:
              criptoProvider.favoritos.contains(cripto) ? Colors.yellow : null,
        ),
        onPressed: () => criptoProvider.toggleFavorito(cripto),
      ),
    );
  }
}
