import 'package:app_design_implementation/Screen/Detail_Screen.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const HomeCardWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isLightMode = theme.brightness == Brightness.light;

    // Custom colors for light mode, aligned with purple theme
    final ColorLight = Color(0xFF4B0082); // Indigo / Dark violet

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => DetailScreen(
                  title: title,
                  description: description,
                  imagePath: imagePath,
                  price: price,
                ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFBFA0FF).withOpacity(0.1),
              Colors.white.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurpleAccent.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isLightMode ? ColorLight : textTheme.titleLarge?.color,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                style: textTheme.bodyMedium?.copyWith(
                  color: isLightMode ? ColorLight : textTheme.labelLarge?.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
