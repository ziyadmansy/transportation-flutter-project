class Order {
  int id;
  String fromCountry;
  String toCountry;
  int weight;
  String service;

  Order({
    required this.id,
    required this.fromCountry,
    required this.toCountry,
    required this.weight,
    required this.service,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      fromCountry: json['from_country'],
      toCountry: json['to_country'],
      weight: json['weight'],
      service: json['service'],
    );
  }
}
