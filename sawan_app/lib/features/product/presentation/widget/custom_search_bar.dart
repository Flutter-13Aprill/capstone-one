import 'package:flutter/material.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 46,
        width: 358,
        child: SearchBar(
          trailing: [Icon(Icons.search, color: AppPalette.primeryColorWhite)],
          hintText: "ابحث هنا",
          hintStyle: WidgetStateProperty.all(
            TextStyles.alexandra400size14.copyWith(
              color: AppPalette.primeryColorWhite,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(AppPalette.white),
          side: WidgetStateProperty.all(
            BorderSide(color: Colors.transparent, width: 4),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }
}
