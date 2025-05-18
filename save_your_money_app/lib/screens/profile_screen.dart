import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:save_your_money_app/controllers/profile_controller.dart';
import 'package:save_your_money_app/screens/login_screen.dart';
import 'package:save_your_money_app/widgets/circle_avatar_widget.dart';
import 'package:save_your_money_app/widgets/listtile_widget.dart';
import 'package:save_your_money_app/widgets/shimmer_circle_avatar_widget.dart';
import 'package:save_your_money_app/widgets/shimmer_listtile_widget.dart';
import 'package:save_your_money_app/widgets/translation_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
// Profile screen page using a controller to manage loading state with shimmer effects,
// custom widgets for avatar and list tiles, localization, and logout confirmation dialog.

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = ProfileController();

  @override
  void initState() {
    super.initState();

    // Show shimmer for 3 seconds and then stop
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        controller.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return Scaffold(
      appBar: TranslationWidget(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child:
              controller.isLoading
                  ? Column(
                    children: [
                      SizedBox(height: 56),
                      ShimmerCircleAvatarWidget(),
                      SizedBox(height: 48),
                      ShimmerListtileWidget(),
                      SizedBox(height: 16),
                      ShimmerListtileWidget(),
                      SizedBox(height: 16),
                      ShimmerListtileWidget(),
                      SizedBox(height: 16),
                      ShimmerListtileWidget(),
                    ],
                  )
                  : Column(
                    children: [
                      SizedBox(height: 56),
                      CircleAvatarWidget(
                        imagePath: "assets/images/profile.png",
                      ),
                      SizedBox(height: 48),
                      ListtileWidget(
                        title: "edit_profile".tr(),
                        icon: Icons.edit,
                      ),
                      SizedBox(height: 16),
                      ListtileWidget(
                        title: "settings".tr(),
                        icon: Icons.settings,
                      ),
                      SizedBox(height: 16),
                      ListtileWidget(title: "about_us".tr(), icon: Icons.info),
                      SizedBox(height: 16),

                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  backgroundColor: Color(0xff252836),
                                  title: Text(
                                    "logout_confirmation".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "no".tr(),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "yes".tr(),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        },
                        child: ListtileWidget(
                          title: "logout".tr(),
                          icon: Icons.logout,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
