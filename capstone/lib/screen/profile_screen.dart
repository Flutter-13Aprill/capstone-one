import 'package:capstone/style/colors.dart';
import 'package:capstone/screen/login_screen.dart';
import 'package:capstone/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = AppColors.primaryRed;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("profile".tr(), style: theme.textTheme.titleLarge),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Info
              Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage:
                        AssetImage('assets/images/profileimage.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Manal Almarri", style: theme.textTheme.titleMedium),
                      Text("community_contributor".tr(),
                          style: TextStyle(color: primary)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statCard("meals_saved".tr(), "25", Icons.fastfood, primary),
                  _statCard(
                      "green_points".tr(), "320", Icons.eco, Colors.green),
                ],
              ),
              const SizedBox(height: 30),
              const Divider(height: 1),
              const SizedBox(height: 16),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "settings".tr(),
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),

              const SizedBox(height: 12),

              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text("about_zadak".tr()),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: theme.cardColor,
                      title: Text("about_zadak".tr()),
                      content: Text("about_description".tr(),
                          textAlign: TextAlign.justify),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("close".tr()),
                        ),
                      ],
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.language),
                title: Text("change_language".tr()),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("select_language".tr()),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                              title: const Text("English"),
                              onTap: () {
                                context.setLocale(const Locale('en', 'US'));
                                Navigator.pop(context);
                              }),
                          ListTile(
                              title: const Text("العربية"),
                              onTap: () {
                                context.setLocale(const Locale('ar', 'AR'));
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.contact_mail_outlined),
                title: Text("contact_us".tr()),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: theme.cardColor,
                      title: Text("contact_us".tr()),
                      content: Text("contact_details".tr()),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("ok".tr()),
                        ),
                      ],
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: Text("register_login".tr()),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("register_login".tr()),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("login".tr()),
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()),
                            ),
                          ),
                          ListTile(
                            title: Text("signup".tr()),
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignupScreen()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text("logout".tr(),
                    style: const TextStyle(color: Colors.red)),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("logout_confirm_title".tr()),
                      content: Text("logout_confirm_msg".tr()),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: Text("cancel".tr())),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                            // Add logout logic
                          },
                          child: Text("logout".tr(),
                              style: const TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _statCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.grey[800])),
          ],
        ),
      ),
    );
  }
}
