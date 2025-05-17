import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
    // Custom ListTile for profile screen.

   final Icon leadingIcon;// Leading icon.
  final Icon tralingIcon; // Trailing icon.
 
  final String title; // Trailing icon.
  ProfileListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.tralingIcon,
   });

  @override
  Widget build(BuildContext context) {
    return ListTile(//return ListTile
      title: Text(title.tr(), style: Theme.of(context).textTheme.headlineLarge),// Localized title with large headline style.
      leading: leadingIcon,// Display leading icon.
      trailing: tralingIcon,// Display trailing icon.
      
    );
  }
}
