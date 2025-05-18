import 'package:coffee/screens/favorite_screen.dart';
import 'package:coffee/screens/items/item_screen.dart';
import 'package:coffee/screens/profile_screen.dart';
import 'package:coffee/style/app_colors.dart';
import 'package:coffee/widget/custom_product.dart';
import 'package:coffee/widget/custom_search_bar.dart';
import 'package:coffee/widget/custom_tab_bar.dart';
import 'package:coffee/widget/img_in_sliver.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.darkGray,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        spacing: 16,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Location'.tr(),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.asset('assets/images/action.png', height: 30),
                            ],
                          ),
                          CustomSearchBar(), 
                          isLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 300,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            )
                          : const ImgInSliver(), 
        
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SizedBox(height: 32,),
                    isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(2, (_) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 160,
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          );
                        }),
                      )
                    :StatefulBuilder(
                      
                      builder: (context, setState) {
                        final TabController controller = DefaultTabController.of(context);
                        return SizedBox(
                        height: 60,
                        child: TabBar(
                          isScrollable: true,
                          dividerHeight: 0,
                          labelPadding: EdgeInsets.symmetric(horizontal: 12),
                          indicatorColor: AppColors.tranparent,
                          onTap: (_) => setState(() {}),
                          tabs: List.generate(4, (index) {
                            final titles = ['All'.tr(), 'Cappuccino'.tr(), 'Latte'.tr(), 'Machiato'.tr()];
                            final isSelected = controller.index == index;

                            return CustomTabBar(
                              title: titles[index],
                              contanerColor: isSelected ? AppColors.brown : AppColors.lightGray,
                              textColor: isSelected ? AppColors.white : AppColors.darkGray,
                            );
                          }),

                        ),
                      );
                        }
                      
                    ),
                    SizedBox(height: 32,),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ItemScreen()));
                          },
                          child: CustomProduct(img: 'assets/images/coffee1.png',type: 'Cappuccino1'.tr(),price: '\$4.53',rate: '4.8',)),
                        CustomProduct(img: 'assets/images/coffee2.png',type: 'Machiato1'.tr(),price: '\$4.53',rate: '4.8',),
                      ],
                    ),
                    
                    SizedBox(height: 32),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomProduct(img: 'assets/images/coffee3.png',type: 'Latte1'.tr(),price: '\$4.53',rate: '4.8',),
                        CustomProduct(img: 'assets/images/coffee4.png',type: 'Cappucino2'.tr(),price: '\$4.53',rate: '4.8',),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomProduct(img: 'assets/images/coffee1.png',type: 'Latte2'.tr(),price: '\$4.53',rate: '4.8',),
                        CustomProduct(img: 'assets/images/coffee2.png',type: 'Machiato2'.tr(),price: '\$4.53',rate: '4.8',),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: AppColors.lightGray,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.home, color: AppColors.brown, size: 40),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
                },
                child: Icon(
                  Icons.heart_broken,
                  color: AppColors.gray,
                  size: 40,
                ),
              ),
              InkWell(
                onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));},
                child: Icon(Icons.person, color: AppColors.gray, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
