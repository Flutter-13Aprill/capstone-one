import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslationWidget extends StatelessWidget implements PreferredSizeWidget {
  const TranslationWidget({super.key});

  // This widget defines a custom AppBar with a language switch icon,
  // and is reused across all pages to provide consistent language toggle functionality.

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        IconButton(
          icon: Icon(
            Icons.language_rounded,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
          tooltip: 'Change Language',
          onPressed: () {
            final currentLocale = context.locale;
            final newLocale =
                currentLocale.languageCode == 'en'
                    ? const Locale('ar', 'AR')
                    : const Locale('en', 'US');
            context.setLocale(newLocale);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
