import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/favourite/controller/list_product_favorit.dart';
import 'package:sawan_app/features/favourite/widget/custom_card_fav.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favotiet".tr(),
          style: TextStyles.alexandra700size18.copyWith(
            color: AppPalette.primeryColorBlue,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: ListProductFavorit.favoritItem.length,
        itemBuilder: (context, index) {
          return CustomCardFav(
            produt: ListProductFavorit.favoritItem[index],
            remove: () {
              ListProductFavorit.favoritItem.removeAt(index);
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
