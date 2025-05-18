class CategoryModel {
  final String imagePath;
  final String category;
  bool isActive;

  CategoryModel({
    required this.imagePath,
    required this.category,
    this.isActive = false,
  });

  void setActive(bool value) {
    isActive = value;
  }
}
