import 'package:coffee/screens/deliver_screen.dart';
import 'package:coffee/style/app_colors.dart';
import 'package:coffee/widget/custom_botton.dart';
import 'package:coffee/widget/custom_coffee_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.heart_broken, size: 30,),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/item.png', ),
            Text('Cappuccino1'.tr(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('with Chocolate'.tr()),
                  SizedBox(height: 16,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star_rounded, color: Colors.amberAccent,),
                      Text('4.8'),
                      Text('(230)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),)
                    ],
                  )
                ],
              ),
              SizedBox(width: 150,),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightPink,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/images/bean.png'),
                
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightPink,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/images/milk.png'),
                
              )
            ],),
            Divider(color: AppColors.gray, thickness: 0.3),
            Text('Description'.tr(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
            Text('A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More'.tr(), style: TextStyle(color: AppColors.ongray, fontSize: 16)),
            SizedBox(height: 8,),
            Text('Size'.tr(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              CustomCoffeeSize(size: 'S', box: AppColors.white, border: AppColors.lightGray),
              CustomCoffeeSize(size: 'M',textColor: AppColors.brown, box: AppColors.lightBrown, border: AppColors.brown),
              CustomCoffeeSize(size: 'L', box: AppColors.white, border: AppColors.lightGray),
            ],),
            Divider(color: AppColors.gray, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('price'.tr()),
                    SizedBox(height: 8,),
                    Text('\$4.53', style: TextStyle(color: AppColors.brown, fontSize: 16, fontWeight: FontWeight.bold),)
                  ],
                ),
                CustomBotton(lable: 'Buy Now'.tr(), screen: DeliverScreen(), width: 0.6)
              ],
            )
          ],
        ),
      ),
    );
  }
}