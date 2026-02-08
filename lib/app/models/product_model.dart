class Product {
  final String id;
  final String name;
  final double price;
  final String image; // emoji now, image URL later
  final double rating;
  final bool isNew;
  final bool isRecommended;
  final String categoryId;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.categoryId,
    this.isNew = false,
    this.isRecommended = false,
  });
}
