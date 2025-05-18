import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/Controllers/categories_controller.dart';
import 'package:capstone1/CustomWidgets/CategoriesScreen/category_item.dart';
import 'package:capstone1/CustomWidgets/General/balance_header.dart';
import 'package:capstone1/CustomWidgets/white_container.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.balanceHeaderController});
  final BalanceHeaderController balanceHeaderController;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesController categoriesController = CategoriesController();

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Categories', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BalanceHeader(controller: widget.balanceHeaderController),
          Spacer(),
          // CATEGORIES GRID
          WhiteContainer(
            child: Padding(
              padding: EdgeInsets.only(top: context.screenHeight * 0.03),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 24,
                ),
                itemCount: categoriesController.categoriesList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      categoriesController.isActiveCategory(index);
                      setState(() {});
                    },

                    child: CategoryItem(
                      imagePath:
                          categoriesController.categoriesList[index].imagePath,
                      category:
                          categoriesController.categoriesList[index].category,
                      active:
                          categoriesController.categoriesList[index].isActive,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
