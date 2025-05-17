import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/home/data/product_data.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.produt, this.remove});
  final ProductData produt;
  final void Function()? remove;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 358,
      child: Card(
        color: AppPalette.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: widget.remove,
                icon: Icon(Icons.close),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(widget.produt.image),
            ),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 14, 100, 100),
                child: Text(
                  widget.produt.name.tr(),
                  style: TextStyles.alexandra700.copyWith(
                    color: AppPalette.primeryColorBlue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),
              child: Row(
                children: [
                  Text(
                    widget.produt.price,
                    style: TextStyles.alexandra700.copyWith(
                      color: AppPalette.primeryColorBlue,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(width: 20),

                  Row(
                    children: [
                      IconButton(
                        onPressed: decreaseQuantity,
                        icon: Icon(Icons.remove),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: increaseQuantity,
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
