import 'package:flutter/material.dart';

// -- Eternal Package 
import 'package:easy_localization/easy_localization.dart';
import 'package:shabah/controllers/localization_controller.dart';

// -- Extensions 
import 'package:shabah/extensions/screen_size.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';


class ServiceSection extends StatefulWidget {

  /// [ServiceSection] to display detailed information about a service,
  /// including:
  /// - Service title and subtitle
  /// - A list of included features or services shown as chips
  /// - Uses localization controller to adjust text alignment dynamically
  /// - Adapts spacing based on screen size via custom extensions
  const ServiceSection({super.key, required this.nameService ,required this.title, required this.subtitle, required this.listOfIncludedServices, required this.serviceIndex});

  final String nameService;
  final String title;
  final String subtitle;
  final List<String> listOfIncludedServices;
  final int serviceIndex;


  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.getHeight(multiplied: 0.04)),

        Align(
          alignment: LocalizationController.setAlignment(context: context),
          child: Text(widget.title, style: Theme.of(context).textTheme.labelMedium,),
        ),

        SizedBox(height: context.getHeight(multiplied: 0.02)),

        Text(widget.subtitle,style: Theme.of(context).textTheme.bodyMedium!,),

        SizedBox(height: context.getHeight(multiplied: 0.02)),

        Align(
          alignment: LocalizationController.setAlignment(context: context),
          child: Text(context.tr('includes_text'), style: Theme.of(context).textTheme.bodyMedium),
        ),

        SizedBox(height: context.getHeight(multiplied: 0.01)),

        Align(
          alignment: LocalizationController.setAlignment(context: context),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(widget.listOfIncludedServices.length, (index) {
              return Container(
                padding: EdgeInsets.all(8),
                height: context.getHeight(multiplied: 0.042),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.tertiaryColor,
                ),
                child: Text(widget.listOfIncludedServices[index], style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.includedChipTextColor,fontSize: 16,),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

