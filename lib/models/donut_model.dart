class Donut {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final String category;
  bool isFavorited; // Not final, so we can change it

  Donut({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.category,
    this.isFavorited = false, // Default to not favorited
  });
}