class Cripto {
  final String id;
  final String name;
  final double price;

  Cripto({required this.id, required this.name, required this.price});

  factory Cripto.fromJson(Map<String, dynamic> json) {
    return Cripto(
      id: json['id'],
      name: json['name'],
      price: json['current_price'].toDouble(),
    );
  }

  get value => null;

  String? get imageUrl => null;
}