import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Screen/Cart_Screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PaymentScreen extends StatelessWidget {
  final double price;
  final String title;
  final String image;

  const PaymentScreen({
    super.key,
    required this.price,
    required this.title,
    required this.image,
  });

  Widget _gradientTitle(String text, double fontSize) {
    return ShaderMask(
      shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: isDark
          ? const Color(0xFF24243E)
          : AppThemes.lightTheme.scaffoldBackgroundColor,
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
        title: _gradientTitle(tr('payment_methods'), 24),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // Category Title
                Center(
                  child: Text(
                    '${tr('category')} : $title',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Price
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: isDark
                          ? [Colors.tealAccent, Colors.lightBlueAccent]
                          : [Colors.deepPurpleAccent, Colors.pinkAccent],
                    ).createShader(bounds),
                    child: Text(
                      '${tr('total')}: \$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Section Title
                Text(
                  tr('select_payment_method'),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: isDark
                            ? [Colors.tealAccent.shade100, Colors.lightBlueAccent.shade100]
                            : [Colors.deepPurpleAccent, Colors.pinkAccent],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),

                const SizedBox(height: 20),

                // Pay with Card
                _paymentOption(
                  context: context,
                  icon: Icons.credit_card,
                  label: tr('pay_with_card'),
                  gradientColors: isDark
                      ? [const Color(0xFF836FFF), const Color(0xFFBFA0FF)]
                      : [Colors.deepPurpleAccent, Colors.pinkAccent],
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartScreen(
                          title: title,
                          image: image,
                          price: price,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Pay with Apple Pay
                _paymentOption(
                  context: context,
                  icon: Icons.phone_iphone,
                  label: tr('pay_with_apple_pay'),
                  gradientColors: isDark
                      ? [Colors.black, Colors.grey.shade800]
                      : [Colors.black, Colors.grey.shade400],
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartScreen(
                          title: title,
                          image: image,
                          price: price,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
