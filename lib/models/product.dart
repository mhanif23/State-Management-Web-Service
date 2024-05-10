class Product {
  final int id;
  final String brand;
  final String model;
  final String processor;
  final String ram;
  final String storage;
  final double displaySize;
  final String graphicsCard;
  final double price;

  Product({
    required this.id,
    required this.brand,
    required this.model,
    required this.processor,
    required this.ram,
    required this.storage,
    required this.displaySize,
    required this.graphicsCard,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      processor: json['processor'],
      ram: json['ram'],
      storage: json['storage'],
      displaySize: json['display_size'].toDouble(),
      graphicsCard: json['graphics_card'],
      price: json['price'].toDouble(),
    );
  }
}