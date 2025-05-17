import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/cart/controller/list_product.dart';
import 'package:sawan_app/features/cart/presentation/widget/custom_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "cart".tr(),
          style: TextStyles.alexandra700size18.copyWith(
            color: AppPalette.primeryColorBlue,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: ListProduct.caetProdut.length,
        itemBuilder: (context, index) {
          return CustomCard(
            produt: ListProduct.caetProdut[index],
            remove: () {
              ListProduct.caetProdut.removeAt(index);
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
