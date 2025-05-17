import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/function/navigation.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/favourite/controller/list_product_favorit.dart';
import 'package:sawan_app/features/home/data/product_data.dart';
import 'package:sawan_app/features/watch%20product/presentation/pages/watch_screen.dart';
import 'package:shimmer/shimmer.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key, required this.loading});
  final bool loading;
  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade600,
        period: const Duration(seconds: 2),
        child: SizedBox(
          height: 500,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: productDates.length,
            itemBuilder: (context, index) {
              final product = productDates[index];

              return GestureDetector(
                onTap: () {
                  customPush(context, WatchScreen(produt: product));
                },
                child: SizedBox(
                  child: Card(
                    color: AppPalette.white,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.fill,
                              ),
                            ),

                            Positioned(
                              top: 5,
                              right: 5,
                              child: IconButton(
                                onPressed: () {
                                  if (!ListProductFavorit.favoritItem.contains(
                                    product,
                                  )) {
                                    ListProductFavorit.favoritItem.add(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'added_to_favorites'.tr(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "already_in_favorites".tr(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                icon: Icon(Icons.favorite_border),
                              ),
                            ),
                          ],
                        ),

                        Text(
                          product.name,
                          style: TextStyles.alexandra700size14,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.price,
                            style: TextStyles.alexandra400size14.copyWith(
                              color: AppPalette.primeryColorBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 500,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: productDates.length,
          itemBuilder: (context, index) {
            final product = productDates[index];

            return GestureDetector(
              onTap: () {
                customPush(context, WatchScreen(produt: product));
              },
              child: SizedBox(
                child: Card(
                  color: AppPalette.white,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(product.image, fit: BoxFit.fill),
                          ),

                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              onPressed: () {
                                if (!ListProductFavorit.favoritItem.contains(
                                  product,
                                )) {
                                  ListProductFavorit.favoritItem.add(product);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('added_to_favorites'.tr()),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "already_in_favorites".tr(),
                                      ),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(Icons.favorite_border),
                            ),
                          ),
                        ],
                      ),

                      Text(
                        product.name.tr(),
                        style: TextStyles.alexandra700size14,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.price.tr(),
                          style: TextStyles.alexandra400size14.copyWith(
                            color: AppPalette.primeryColorBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
