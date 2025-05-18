import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Screen/Payment_Screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailPurchaseBottomSheetWidget extends StatelessWidget {
  final double price;
  final String titel;
  final String image;

  const DetailPurchaseBottomSheetWidget({
    Key? key,
    required this.price,
    required this.titel,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.3,
      maxChildSize: 0.75,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: isDark ? AppThemes.darkTheme.scaffoldBackgroundColor : AppThemes.lightTheme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: ListView(
          controller: controller,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[600] : Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'confirm_purchase'.tr(),
              style: TextStyle(
                color: isDark
                    ? AppThemes.darkTheme.textTheme.displayLarge?.color ?? Colors.white
                    : AppThemes.lightTheme.textTheme.displayLarge?.color ?? Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                titel,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'price'.tr(),
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black54,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? const Color(0xFFBFA0FF)
                        : const Color(0xFF836FFF),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      price: price,
                      title: titel,
                      image: image,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? const Color(0xFFBFA0FF)
                    : const Color(0xFF836FFF),
                foregroundColor: isDark ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                shadowColor: isDark
                    ? const Color(0xFFBFA0FF).withOpacity(0.6)
                    : const Color(0xFF836FFF).withOpacity(0.6),
              ),
              child: Text(
                'process_payment'.tr(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
