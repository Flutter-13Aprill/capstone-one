import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jojo_bakery/controller/cart_controller.dart';
import 'package:jojo_bakery/screens/pay_page.dart';
import 'package:jojo_bakery/theme/app_colors.dart';
import 'package:jojo_bakery/widgets/cart_item.dart';
import 'package:jojo_bakery/widgets/custom_button.dart';
import 'package:jojo_bakery/widgets/summary_row.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = CartController();

  double calculateTotal() {
    double total = 0;
    for (var product in cartController.cartItems) {
      total += product.price!;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart_title'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user1.png'),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text('confirm_delete_title'.tr()),
                            content: Text('confirm_delete_body'.tr()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'cancel'.tr(),
                                  selectionColor: AppColors.primary,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    cartController.clearCart();
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'delete'.tr(),
                                  selectionColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                  child: Text(
                    'delete_all'.tr(),
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                Text(
                  'product'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartController.cartItems[index];
                return CartItem(
                  name: product.title!,
                  price: product.price!,
                  image: product.imagePath!,
                  quantity: 1,
                  onDelete: () {
                    setState(() {
                      cartController.removeFromCart(product);
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 16),
            SummaryRow(title: 'subtotal'.tr(), value: ''),
            SummaryRow(
              title: 'total'.tr(),
              value: '${calculateTotal().toStringAsFixed(2)} SR',
              isTotal: true,
            ),
            const SizedBox(height: 16),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                backgroundColor: AppColors.primary,
                text: 'checkout'.tr(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayPage(total: calculateTotal()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
