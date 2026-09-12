class Listing {
  const Listing({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageAsset,
    required this.sellerName,
    required this.location,
    this.description = '',
    this.condition = 'Utmärkt',
  });

  final String id;
  final String title;
  final String category;
  final int price;
  final String imageAsset;
  final String sellerName;
  final String location;
  final String description;
  final String condition;

  String get formattedPrice =>
      '${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]} ')} kr';
}
