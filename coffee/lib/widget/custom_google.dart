import 'package:coffee/style/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomGoogle extends StatelessWidget {
  const CustomGoogle({super.key, required this.img, required this.lable});
  final String img;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    width: MediaQuery.sizeOf(context).width*0.8,
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('OR'.tr(), style: TextStyle(color: AppColors.white, fontSize: 16),),
                        Container(
                          width: MediaQuery.sizeOf(context).width*1,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(img, width: 60,),
                              Text(lable, style: TextStyle(color: AppColors.darkGray, fontSize: 20),),
                            ],
                          ),),
                        )
                      ],
                    ),
                  );
  }
}