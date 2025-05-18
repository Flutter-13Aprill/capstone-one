import 'package:flutter/material.dart';

// External Package 
import 'package:easy_localization/easy_localization.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  Icon(Icons.add_shopping_cart, size: 30),
                  Text(context.tr('empty_cart_message')),
                ],
              ),
            );
  }
}