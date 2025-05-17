import 'package:sawan_app/core/text/app_text.dart';

class ProductData {
  final String image;
  final String name;
  final String price;

  ProductData({required this.image, required this.name, required this.price});
}

List<ProductData> productDates = [
  ProductData(
    image: "assets/images/watch1.png",
    name: "watchname1",
    price: AppText.price1,
  ),
  ProductData(
    image: "assets/images/watch2.png",
    name: "watchname1",
    price: AppText.price1,
  ),
  ProductData(
    image: "assets/images/watch3.png",
    name: "watchname1",
    price: AppText.price1,
  ),
  ProductData(
    image: "assets/images/watch5.png",
    name: "watchname1",
    price: AppText.price1,
  ),
  ProductData(
    image: "assets/images/watch6.png",
    name: "watchname1",
    price: AppText.price1,
  ),
  ProductData(
    image: "assets/images/watch7.png",
    name: "watchname1",
    price: AppText.price1,
  ),
];
