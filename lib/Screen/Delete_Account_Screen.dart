import 'package:app_design_implementation/Screen/Login_Signup_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';
import 'package:easy_localization/easy_localization.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});
  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool _isDeleting = false;

  Future<void> _deleteAccount() async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF2D2B40) : const Color(0xFFF1EBFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : const Color(0xFF3E1F92),
        ),
        contentTextStyle: TextStyle(
          fontSize: 16,
          color: isDark ? Colors.white70 : const Color(0xFF4B3D6B),
        ),
        title: Text('confirm_delete_account'.tr()),
        content: Text('delete_account_warning'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              'cancel'.tr(),
              style: TextStyle(
                color: isDark ? Colors.white70 : const Color(0xFF5D3A86),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'delete'.tr(),
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        _isDeleting = true;
      });

      // Simulate account deletion delay
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginSignupScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
          child: Text(
            'delete_account'.tr(),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: isDark ? _buildDarkGradient() : AppThemes.gradientBackground,
        ),
        leading: IconButton(
          icon: ShaderMask(
            shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: isDark ? _buildDarkGradient() : AppThemes.gradientBackground,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "warning".tr(),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent.shade400,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "delete_account_desc".tr(),
              style: TextStyle(
                color: textColor.withOpacity(0.85),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "delete_account_confirm".tr(),
              style: TextStyle(
                color: textColor.withOpacity(0.75),
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: _isDeleting
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          gradient: AppThemes.titleGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: _deleteAccount,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'delete_account'.tr(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  BoxDecoration _buildDarkGradient() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
}
