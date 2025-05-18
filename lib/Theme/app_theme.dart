// import 'package:flutter/material.dart';
// import 'app_colors.dart'; // Assuming your colors are in this file

// class AppTheme {
//   // Light Theme
//   static final ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppColors.background,
    
//     colorScheme: const ColorScheme.light(
//       primary: AppColors.primary,
//       secondary: AppColors.secondary,
//       surface: AppColors.surface,
//       background: AppColors.background,
//       error: AppColors.error,
//     ),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: AppColors.primary,
//       foregroundColor: Colors.white,
//       elevation: 0,
//     ),

//     cardTheme: const CardTheme(
//       color: AppColors.surface,
//       elevation: 1,
//       margin: EdgeInsets.zero,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//     ),

//     textTheme: const TextTheme(
//       headlineSmall: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: AppColors.textPrimary,
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 14,
//         color: AppColors.textSecondary,
//       ),
//     ),
//     dividerTheme: const DividerThemeData(
//       color: AppColors.divider,
//       thickness: 1,
//       space: 1,
//     ),
//     // Add more theme customizations as needed
//   );

//   // Dark Theme (Optional)
//   static final ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     // Define dark mode colors (invert or use darker shades)
//     scaffoldBackgroundColor: const Color(0xFF121212),
//     colorScheme: const ColorScheme.dark(
//       primary: Color(0xFFBB86FC),
//       secondary: Color(0xFF03DAC6),
//     ),
//     // Customize other dark theme properties...
//   );
// }
import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    canvasColor: AppColors.surface,
    cardColor: AppColors.surfaceDark,
    dividerColor: AppColors.divider,
    hintColor: AppColors.textHint,
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textSecondary,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: AppColors.textHint,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      elevation: 1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: const Color(0xFF121212),
    canvasColor: const Color(0xFF1E1E1E),
    cardColor: const Color(0xFF2C2C2C),
    dividerColor: const Color(0xFF3A3A3A),
    hintColor: const Color(0xFF9CA3AF),
    iconTheme: const IconThemeData(color: Colors.white70),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Color(0xFF9CA3AF),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

