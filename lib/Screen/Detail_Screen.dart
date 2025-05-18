import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Favorite_Provider.dart';
import 'package:app_design_implementation/Widgets/Detail_Purchase_BottomSheet_Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';



class DetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const DetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  // Reusable gradient title widget
  Widget _gradientTitle(String text, double fontSize) {
    return ShaderMask(
      shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ).copyWith(fontSize: fontSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final item = {
      'imagePath': imagePath,
      'title': title,
      'description': description,
      'price': price,
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ShaderMask(
            shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: _gradientTitle(title, 24),
        flexibleSpace: Container(
          decoration: isDark
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )
              : AppThemes.gradientBackground,
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: isDark
            ? const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              )
            : AppThemes.gradientBackground,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                    height: 460,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24,
                    right: 40,
                    child: Consumer<FavoriteProvider>(
                      builder: (context, provider, _) {
                        final isFav = provider.isFavorite(item);
                        return GestureDetector(
                          onTap: () {
                            provider.toggleFavorite(item);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _gradientTitle(title, 22),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: isDark
                      ? [Colors.tealAccent, Colors.lightBlueAccent]
                      : [Colors.deepPurpleAccent, Colors.pinkAccent],
                ).createShader(bounds),
                child: Text(
                  tr('price'), // localized
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: isDark
                      ? [Colors.tealAccent, Colors.lightBlueAccent]
                      : [Colors.deepPurpleAccent, Colors.pinkAccent],
                ).createShader(bounds),
                child: Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (_) => DetailPurchaseBottomSheetWidget(
                      image: imagePath,
                      price: price,
                      titel: title,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? Colors.amberAccent : Colors.deepPurpleAccent,
                  foregroundColor: isDark ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                ),
                child: Text(
                  tr('purchase'), // localized
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
