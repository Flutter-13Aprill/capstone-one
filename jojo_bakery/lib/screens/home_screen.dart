import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jojo_bakery/controller/cart_controller.dart';
import 'package:jojo_bakery/controller/local_controller.dart';
import 'package:jojo_bakery/models/product.dart';
import 'package:jojo_bakery/screens/cart_screen.dart';
import 'package:jojo_bakery/screens/product_detail.dart';
import 'package:jojo_bakery/screens/profile_screen.dart';
import 'package:jojo_bakery/theme/app_colors.dart';
import 'package:jojo_bakery/widgets/circular.dart';
import 'package:jojo_bakery/widgets/product_card.dart';
import 'package:jojo_bakery/widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final loclaiztionController = LocalizationController();

  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    final List<Product> featuredProducts = [
      Product(
        title: 'products.croissant_chocolate'.tr(),
        price: 15,
        imagePath: 'assets/images/croissant.png',
      ),
      Product(
        title: 'products.babka_chocolate'.tr(),
        price: 13,
        imagePath: 'assets/images/babka.png',
      ),
      Product(
        title: 'products.babka_thyme'.tr(),
        price: 10,
        imagePath: 'assets/images/babka2.png',
      ),
    ];
    final List<Product> recommendedProducts = [
      Product(
        title: 'products.sourdough'.tr(),
        price: 34,
        imagePath: 'assets/images/sourdough.png',
      ),
      Product(
        title: 'products.cheesecake'.tr(),
        price: 24,
        imagePath: 'assets/images/image1.png',
      ),
      Product(
        title: 'products.chocolate_cake'.tr(),
        price: 12,
        imagePath: 'assets/images/images2.png',
      ),
    ];
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.cardColors,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/user2.png'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'drawer.store_name'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: AppColors.primary),
              title: Text(
                'drawer.about_store'.tr(),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: AppColors.primary),
              title: Text(
                'drawer.terms_conditions'.tr(),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt_long, color: AppColors.primary),
              title: Text(
                'drawer.order_details'.tr(),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(color: AppColors.primary),
            ListTile(
              leading: Icon(Icons.language, color: AppColors.primary),
              title: Text(
                'drawer.change_language'.tr(),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                loclaiztionController.toggleLang(context);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart, color: AppColors.primary),
          ),
        ],
        title: Text(
          'app_bar.title'.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: TextFormField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  hintText: 'search.hint'.tr(),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primary,
                    size: 32,
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 32, bottom: 8),
                    child: Text(
                      'home.slogan'.tr(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // textDirection: TextDirection.rtl,
                      children: [
                        SizedBox(width: 16),
                        CircularImageIcon(
                          label: 'home.categories.all'.tr(),
                          hasBorder: true,
                          imagePath: 'assets/icons/jojo1.png',
                        ),
                        CircularImageIcon(
                          label: 'home.categories.baguette'.tr(),
                          imagePath: 'assets/icons/jojo2.png',
                        ),
                        CircularImageIcon(
                          label: 'home.categories.croissant'.tr(),
                          imagePath: 'assets/icons/jojo3.png',
                        ),
                        CircularImageIcon(
                          label: 'home.categories.cookies'.tr(),
                          imagePath: 'assets/icons/jojo4.png',
                        ),
                        CircularImageIcon(
                          label: 'home.categories.coffee'.tr(),
                          imagePath: 'assets/icons/jojo5.png',
                        ),
                      ],
                    ),
                  ),
                  SectionHeader(
                    title: 'home.featured.title'.tr(),
                    actionText: 'home.featured.see_all'.tr(),
                    onActionTap: () {},
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          featuredProducts.map((product) {
                            return ProductCard(
                              product: product,
                              onAddToCart: () {
                                cartController.addToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${product.title} ${'home.added_to_cart'.tr()}',
                                    ),
                                  ),
                                );
                                setState(() {});
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            product.detailsPage ?? Container(),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    ),
                  ),
                  SectionHeader(
                    title: 'home.recommended.title'.tr(),
                    actionText: 'home.recommended.see_all'.tr(),
                    onActionTap: () {},
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          recommendedProducts.map((product) {
                            return ProductCard(
                              product: product,
                              onAddToCart: () {
                                cartController.addToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${product.title}home.added_to_cart'.tr(),
                                    ),
                                  ),
                                );
                                setState(() {});
                              },
                              onTap: () {
                                if (product.title ==
                                    'products.sourdough'.tr()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ProductDetailScreen(
                                            product: product,
                                          ),
                                    ),
                                  );
                                }
                              },
                            );
                          }).toList(),
                    ),
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
