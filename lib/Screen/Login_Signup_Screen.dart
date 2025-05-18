import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Screen/Privacy_Screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isLogin = true;
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _emailController.text.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              const SizedBox(width: 12),
              Expanded(child: Text('processing'.tr(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
            ],
          ),
          backgroundColor: Colors.teal,
          behavior: SnackBarBehavior.floating,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          duration: const Duration(seconds: 4),
        ),
      );

      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PrivacyScreen()));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text('login_failed'.tr(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
            ],
          ),
          backgroundColor: Colors.deepOrangeAccent,
          behavior: SnackBarBehavior.floating,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: isDark ? const BoxDecoration(color: Color(0xFF1E1A2B)) : AppThemes.gradientBackground,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                  child: Image.asset("assets/Logo1.png", height: 300, fit: BoxFit.cover),
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 280, left: 24, right: 24, bottom: 40),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 6))],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: const Color.fromARGB(255, 159, 149, 149)),
                            ),
                            child: Stack(
                              children: [
                                AnimatedAlign(
                                  alignment: isLogin ? Alignment.centerLeft : Alignment.centerRight,
                                  duration: const Duration(milliseconds: 200),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.35,
                                    decoration: BoxDecoration(
                                      gradient: AppThemes.titleGradient,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => setState(() => isLogin = true),
                                        child: Center(
                                          child: Text("login".tr(), style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => setState(() => isLogin = false),
                                        child: Center(
                                          child: Text("signup".tr(), style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'email_hint'.tr(),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) return 'email_required'.tr();
                              if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) return 'email_invalid'.tr();
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _isPasswordHidden,
                            style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'password_hint'.tr(),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                                onPressed: () => setState(() => _isPasswordHidden = !_isPasswordHidden),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'password_required'.tr();
                              if (value.length < 6) return 'password_short'.tr();
                              if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(value)) return 'password_format'.tr();
                              return null;
                            },
                          ),
                          if (!isLogin) ...[
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _isConfirmPasswordHidden,
                              style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'confirm_password_hint'.tr(),
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
                                suffixIcon: IconButton(
                                  icon: Icon(_isConfirmPasswordHidden ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                                  onPressed: () => setState(() => _isConfirmPasswordHidden = !_isConfirmPasswordHidden),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'confirm_password_required'.tr();
                                if (value != _passwordController.text) return 'confirm_password_mismatch'.tr();
                                return null;
                              },
                            ),
                          ],
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: const Color(0xFF836FFF),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              child: Text(
                                isLogin ? 'submit_login'.tr() : 'submit_signup'.tr(),
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          if (isLogin)
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('forgot_password'.tr(), style: TextStyle(color: Colors.grey[600])),
                              ),
                            ),
                          const SizedBox(height: 20),
                          Text('or'.tr(), style: TextStyle(color: Colors.grey[600])),
                          const SizedBox(height: 10),
                          Image.asset("assets/Media.png", height: 90, width: 240),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
