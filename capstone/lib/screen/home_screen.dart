import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone/style/colors.dart';
import 'package:capstone/screen/map_screen.dart';
import 'package:capstone/screen/meal_details_screen.dart';
import '../widgets/meal_card.dart';
import '../widgets/shimmer_loader.dart';
import '../widgets/filter_chip_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "app_name".tr(), // 🔁 Zadak
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset(
              'assets/images/logo.png',
              width: 50,
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  "meals_nearby".tr(), // 🔁 Meals near Riyadh
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.deepGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MapScreen()),
                    );
                  },
                  child: const Icon(Icons.arrow_drop_down, size: 30),
                ),
              ],
            ),
          ),

          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "search_meals".tr(), // 🔁 Search meals...
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 16),

          const FilterChipList(),
          const SizedBox(height: 16),

          if (isLoading)
            const ShimmerLoader()
          else ...[
            // 🔁 البطاقة الأولى
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MealDetailsScreen(
                      image: 'assets/images/Restaurant Image.png',
                      title: 'Pizza',
                      portions: '3 ${"portions".tr()}',
                      price: "free".tr(),
                      donor: 'Al-Khair Restaurant',
                      availableUntil: 'Until 8:00 PM',
                      location: 'Al-Malaz, Riyadh',
                      notes: 'Fresh and warm!',
                    ),
                  ),
                );
              },
              child: MealCard(
                image: 'assets/images/Restaurant Image.png',
                title: 'Pizza',
                portions: '3 ${"portions".tr()}',
                donor: 'Al-Khair Restaurant',
                price: "free".tr(),
                availableUntil: 'Until 8:00 PM',
              ),
            ),

            // 🔁 البطاقة الثانية
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MealDetailsScreen(
                      image: 'assets/images/riceimage.png',
                      title: 'Chicken Kabsa',
                      portions: '2 ${"portions".tr()}',
                      price: '10 SAR',
                      donor: 'Kabsa Express',
                      availableUntil: 'Until 6:00 PM',
                      location: 'Al-Naseem, Riyadh',
                      notes: 'Delicious and spicy!',
                    ),
                  ),
                );
              },
              child: MealCard(
                image: 'assets/images/riceimage.png',
                title: 'Chicken Kabsa',
                portions: '2 ${"portions".tr()}',
                donor: 'Kabsa Express',
                price: '10 SAR',
                availableUntil: 'Until 6:00 PM',
              ),
            ),

            //3 card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MealDetailsScreen(
                      image: 'assets/images/burger.png',
                      title: 'Cheeseburger',
                      portions: '1 ${"portions".tr()}',
                      price: 'free'.tr(),
                      donor: 'Burger House',
                      availableUntil: 'Until 9:30 PM',
                      location: 'Takhassusi, Riyadh',
                      notes: 'With fries 🍟',
                    ),
                  ),
                );
              },
              child: MealCard(
                image: 'assets/images/burger.png',
                title: 'Cheeseburger',
                portions: '1 ${"portions".tr()}',
                donor: 'Burger House',
                price: 'free'.tr(),
                availableUntil: 'Until 9:30 PM',
              ),
            ),
          ]
        ],
      ),
    );
  }
}
