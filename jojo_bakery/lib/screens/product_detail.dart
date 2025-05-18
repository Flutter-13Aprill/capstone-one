import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jojo_bakery/controller/cart_controller.dart';
import 'package:jojo_bakery/models/product.dart';
import 'package:jojo_bakery/screens/cart_screen.dart';
import 'package:jojo_bakery/theme/app_colors.dart';
import 'package:jojo_bakery/widgets/build_review.dart';
import 'package:jojo_bakery/widgets/custom_button.dart';
import 'package:jojo_bakery/widgets/product_card.dart';
import 'package:jojo_bakery/widgets/rating_summary.dart';
import 'package:jojo_bakery/widgets/section_header.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CartController cartController = CartController();
  bool isLoading = true;

  void addToCart(Product product) {
    cartController.addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.title} تمت إضافته إلى السلة')),
    );
  }

  final List<Product> similarProducts = [
    Product(
      title: 'products.croissant_chocolate'.tr(),
      imagePath: 'assets/images/croissant.png',
      price: 10,
    ),
    Product(
      title: 'products.babka_chocolate'.tr(),
      imagePath: 'assets/images/babka.png',
      price: 10,
    ),
    Product(
      title: 'products.babka_thyme'.tr(),
      imagePath: 'assets/images/babka2.png',
      price: 10,
    ),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget buildImageShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(33),
            bottomRight: Radius.circular(33),
          ),
        ),
      ),
    );
  }

  Widget buildProductCardShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 140,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        height: 180,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.cardColors,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.shopping_cart, color: AppColors.primary),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(33),
                      bottomRight: Radius.circular(33),
                    ),
                    color: AppColors.cardColors,
                  ),
                  child:
                      isLoading
                          ? buildImageShimmer()
                          : Image.asset(
                            widget.product.imagePath ??
                                'assets/images/sourdough.png',
                            height: 240,
                            fit: BoxFit.fitWidth,
                          ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title ?? 'ساوردو',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${widget.product.price?.toStringAsFixed(2) ?? 34} SAR',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'خبز الساوردو لدينا يُحضّر من مكونات طبيعية 100%، باستخدام دقيق عضوي نقي...'
                  'تماماً كما كان يُحضّر منذ مئات السنين 🥖✨',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 16),

              SectionHeader(
                title: 'التعليقات (12)',
                actionText: 'home.featured.see_all'.tr(),
              ),
              BuildReview(
                image: 'assets/images/user1.png',
                name: 'خالد',
                stars: 4,
                comment:
                    'خبز الساوردو من هنا مو بس طازج، بس طعمه ينافس أفضل المحلات! أنصح فيه',
              ),
              const SizedBox(height: 12),
              BuildReview(
                image: 'assets/images/user2.png',
                name: 'سارة',
                stars: 5,
                comment:
                    'عجبني قوام خبز الساوردو ممتاز للسندويشات أو مع الشوربة، تجربة رائعة',
              ),
              const SizedBox(height: 16),
              RatingSummary(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: CustomButton(
                  backgroundColor: AppColors.primary,
                  text: 'اكتب تقييمًا',
                  onPressed: () {},
                ),
              ),
              SectionHeader(
                actionText: 'home.featured.see_all'.tr(),
                title: 'home.similar_products'.tr(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      isLoading
                          ? List.generate(
                            3,
                            (index) => buildProductCardShimmer(),
                          )
                          : similarProducts.map((product) {
                            return ProductCard(
                              product: product,
                              onAddToCart: () => addToCart(product),
                            );
                          }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          backgroundColor: AppColors.primary,
          text: 'home.add_to_cart'.tr(),
          onPressed: () {
            addToCart(widget.product);
          },
        ),
      ),
    );
  }
}
