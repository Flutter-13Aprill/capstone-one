import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/core/widget/custom_elevated_button.dart';
import 'package:sawan_app/features/cart/controller/list_product.dart';
import 'package:sawan_app/features/home/data/product_data.dart';
import 'package:sawan_app/features/watch%20product/presentation/widget/custom_bottom_sheet.dart';
import 'package:sawan_app/features/watch%20product/presentation/widget/custom_watch_descr.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key, required this.produt});

  final ProductData produt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 284,
                width: 347.55,
                child: Image.asset(produt.image, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomWatchDescr(),
              ),
              Stack(
                children: [
                  Container(
                    height: 96,
                    decoration: BoxDecoration(color: AppPalette.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 25),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        produt.price.tr(),
                        style: TextStyles.alexandra700.copyWith(
                          color: AppPalette.primeryColorBlue,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: CustomElvatedButton(
                      press: () {
                        ListProduct.caetProdut.add(produt);
                        showAddToCartBottomSheet(context);
                      },
                      child: Text("add to cart".tr()),
                      height: 48,
                      width: 175,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
