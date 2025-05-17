import 'package:easy_localization/easy_localization.dart';
import 'package:capstone/style/colors.dart';
import 'package:capstone/screen/reservations_screen.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String portions;
  final String price;
  final String donor;
  final String availableUntil;
  final String location;
  final String notes;

  const MealDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.portions,
    required this.price,
    required this.donor,
    required this.availableUntil,
    required this.location,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("meal_details".tr()),
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.colorScheme.onBackground,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(image, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(portions,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.deepGrey, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text("${"price".tr()}: $price",
                      style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 20),
                      const SizedBox(width: 6),
                      Text("${"shared_by".tr()}: $donor",
                          style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 6),
                      Text("${"available_until".tr()}: $availableUntil",
                          style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 20),
                      const SizedBox(width: 6),
                      Text(location, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("notes".tr(),
                      style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onBackground)),
                  const SizedBox(height: 4),
                  Text(notes, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          enableDrag: false,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ReservationsScreen()),
                              );
                            });

                            return SizedBox(
                              height: 300,
                              width: 400,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.green, size: 60),
                                  const SizedBox(height: 16),
                                  Text("meal_reserved".tr(),
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  Text("redirecting".tr(),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: Colors.grey)),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "reserve_meal".tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
