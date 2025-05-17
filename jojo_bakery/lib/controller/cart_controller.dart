import 'package:jojo_bakery/models/product.dart';

class CartController {
  static final CartController _cartController = CartController._internal();
  factory CartController() => _cartController;
  CartController._internal();

  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;
  void addToCart(Product product) {
    _cartItems.add(product);
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
  }

  void clearCart() {
    _cartItems.clear();
  }

  double get totalePrice {
    double totale = 0;
    for (var item in _cartItems) {
      totale += item.price ?? 0;
    }
    return totale;
  }
}
