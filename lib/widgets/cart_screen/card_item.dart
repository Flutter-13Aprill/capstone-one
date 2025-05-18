import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// -- Controller
import 'package:shabah/main.dart';

// -- Extension 
import 'package:shabah/extensions/screen_size.dart';

// -- External Package 
import 'package:flutter_svg/svg.dart';

// -- App Theme
import 'package:shabah/style/app_colors.dart';


class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      height: context.getHeight(multiplied: 0.11),
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 6,
            color: const Color.fromRGBO(0, 0, 0, 0.40),
          ),
        ],
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Align(
            alignment: context.locale.languageCode == 'en' ? Alignment.centerLeft : Alignment.centerRight,
            child: Text('${cart?.serviceName}',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.secondaryColor),
            ),
          ),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(

                spacing: 8,
                children: context.locale.languageCode == 'en' ?
                [
                  Image.asset('assets/home_screen/home_screen_images/People.png',color: AppColors.secondaryColor,),
                  Text('${cart?.numberOfPeople}', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,),),
                ]
                : 
                [
                  Text('${cart?.numberOfPeople}', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,),),
                  Image.asset('assets/home_screen/home_screen_images/People.png',color: AppColors.secondaryColor,),
                ]
              ),

              Row(

                spacing: 8,
                children: context.locale.languageCode == 'en' ?
                [
                  SvgPicture.asset('assets/cart_screen/svgs/SAR.svg'),
                  Text('${cart?.finalCost}',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),)
                ]
                :
                [
                  Text('${cart?.finalCost}',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
                  SvgPicture.asset('assets/cart_screen/svgs/SAR.svg'),
                ]
              ),
            ],
          ),
        ],
      ),
    );
  }
}
