import 'package:capstone/screen/buttom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone/style/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class ReviewMealScreen extends StatelessWidget {
  final Map<String, String> mealData;

  const ReviewMealScreen({super.key, required this.mealData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("review_meal".tr(), style: theme.textTheme.titleLarge),
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.colorScheme.onBackground,
        elevation: 0,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoTile("meal".tr(), mealData['name'] ?? '', theme),
            _infoTile("description".tr(), mealData['description'] ?? '', theme),
            _infoTile("portions".tr(), mealData['portions'] ?? '', theme),
            _infoTile(
              "price".tr(),
              (mealData['price']?.isEmpty ?? true)
                  ? "free".tr()
                  : "${mealData['price']} ${"sar".tr()}",
              theme,
            ),
            _infoTile("available_until".tr(), mealData['availableUntil'] ?? '',
                theme),
            _infoTile("location".tr(), mealData['location'] ?? '', theme),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    enableDrag: false,
                    backgroundColor: theme.scaffoldBackgroundColor,
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
                            builder: (_) => const ButtomNavBarScreen(),
                          ),
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
                            Text(
                              "meal_shared".tr(),
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "redirecting".tr(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.deepGrey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "confirm_publish".tr(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.deepGrey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
