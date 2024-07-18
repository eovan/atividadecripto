import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/cripto.dart';

class CriptoProvider with ChangeNotifier {
  List<Cripto> _criptos = [];
  List<Cripto> _favoritos = [];

  List<Cripto> get criptos => _criptos;
  List<Cripto> get favoritos => _favoritos;

  Future<void> fetchCriptos() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _criptos = data.map((json) => Cripto.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Falha ao carregar criptomoedas');
    }
  }

  void toggleFavorito(Cripto cripto) {
    if (_favoritos.contains(cripto)) {
      _favoritos.remove(cripto);
    } else {
      _favoritos.add(cripto);
    }
    notifyListeners();
  }
}
