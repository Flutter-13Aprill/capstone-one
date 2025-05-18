import 'package:capstone1/Models/category_model.dart';

class CategoriesController {
  List<CategoryModel> categoriesList = [
    CategoryModel(imagePath: 'assets/images/food.png', category: 'Food'),
    CategoryModel(
      imagePath: 'assets/images/transport.png',
      category: 'Transport',
    ),
    CategoryModel(
      imagePath: 'assets/images/medicine.png',
      category: 'Medicine',
    ),
    CategoryModel(
      imagePath: 'assets/images/groceries.png',
      category: 'Groceries',
    ),
    CategoryModel(imagePath: 'assets/images/rent.png', category: 'Rent'),
    CategoryModel(imagePath: 'assets/images/gift.png', category: 'Gifts'),
    CategoryModel(
      imagePath:
          '/Users/solym/src/projects/capstone1/capstone-one/assets/images/savings.png',
      category: 'Savings',
    ),
    CategoryModel(
      imagePath: 'assets/images/entertainment.png',
      category: 'Entertainment',
    ),
    CategoryModel(imagePath: 'assets/images/more.png', category: 'More'),
  ];

  void isActiveCategory(int index) {
    for (int i = 0; i < categoriesList.length; i++) {
      if (i == index) {
        categoriesList[i].setActive(true);
      } else {
        categoriesList[i].setActive(false);
      }
    }
  }
}
