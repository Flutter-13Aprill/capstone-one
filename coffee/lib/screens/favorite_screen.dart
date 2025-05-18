import 'package:coffee/screens/home_screen.dart';
import 'package:coffee/screens/profile_screen.dart';
import 'package:coffee/style/app_colors.dart';
import 'package:coffee/widget/custom_product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.tranparent,
        centerTitle: true,
        title: Text('your favorites'.tr(), style: TextStyle(color: AppColors.ongray),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomProduct(img: 'assets/images/coffee4.png',type: 'Cappucino2'.tr(),price: '\$4.53',rate: '4.8',),
                  CustomProduct(img: 'assets/images/coffee3.png',type: 'Cappuccino1'.tr(),price: '\$4.53',rate: '4.8',),
                ],
              )
            ],
          ),]
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
                onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
                child: Icon(Icons.home, color: AppColors.gray, size: 40),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.heart_broken,
                  color: AppColors.brown,
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