import 'package:flutter/material.dart';

// -- Widgets
import 'package:shabah/widgets/cart_screen/card_item.dart';
import 'package:shabah/widgets/custom_button.dart';

// -- Controller 
import 'package:shabah/main.dart';

// -- External Package
import 'package:easy_localization/easy_localization.dart';

// -- Extension
import 'package:shabah/extensions/screen_size.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

Future<void> showConfirmationBottomSheet({required BuildContext context, required GlobalKey alertKey, required void Function(bool isDone) onDone}) {
  return showModalBottomSheet(
    backgroundColor: AppColors.primaryColor,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Container(
        width: context.getWidth(),
        height: context.getHeight(multiplied: 0.52),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: context.locale.languageCode == 'en' ? Alignment.centerLeft : Alignment.centerRight,
              child: Text(context.tr('confirm_your_shabah_text'),style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.secondaryColor,),),
            ),

            SizedBox(height: context.getHeight(multiplied: 0.03)),

            CardItem(),

            SizedBox(height: context.getHeight(multiplied: 0.02)),

            SizedBox(

              width: context.getWidth(),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(context.tr('shabah_info_text'),style: Theme.of(context).textTheme.labelMedium),
                  Text(context.tr('city_text_in_bottom_sheet', args: [addressController!.city!])),
                  Text(context.tr('address_text_in_bottom_sheet', args: [addressController!.area!])),
                  Text(context.tr('shabah_date_text_in_bottom_sheet', args: [date.datePicked])),

                  SizedBox(height: context.getHeight(multiplied: 0.02)),

                  CustomButton(
                    labelText: context.tr('confirm_label_button'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            key: alertKey,
                            title: Text(context.tr('alert_title_text')),
                            content: Text(context.tr('alert_body_text')),
                          );
                        },
                      );

                      Future.delayed(Duration(seconds: 4), () {
                        if (alertKey.currentContext!.mounted) {
                          onDone(true);
                          Navigator.pop(context);
                        }
                      })
                      ;
                    },

                  ),

                ],

              ),

            ),

          ],

        ),

      );

    },

  );

}
