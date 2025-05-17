import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MealCard extends StatelessWidget {
  final String title;
  final String image;
  final String donor;
  final String portions;
  final String price;
  final String availableUntil;

  const MealCard({
    super.key,
    required this.title,
    required this.image,
    required this.donor,
    required this.portions,
    required this.price,
    required this.availableUntil,
  });

  @override
  Widget build(BuildContext context) {
    final isFree = price.toLowerCase() == 'free';

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text("shared_by".tr(args: [donor]),
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isFree ? "free".tr() : price,
                      style: TextStyle(
                        color: isFree ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$portions • $availableUntil",
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
