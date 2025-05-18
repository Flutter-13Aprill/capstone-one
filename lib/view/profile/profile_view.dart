import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/style/my_style.dart';
import 'package:project_flow/widgets/profile/card_profile_widget.dart';
import 'package:project_flow/widgets/profile/showLogoutDialog_widget.dart';
import 'package:project_flow/widgets/shimmer/shimmer_avatar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoadingAvatar=false;
      });
    });
  }
  bool isLoadingAvatar=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  body: Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StyleApp.sizeH40,
        isLoadingAvatar
            ? shimmerAvatarWidget()
            : CircleAvatar(
                minRadius: 80,
                backgroundColor: Theme.of(context).dividerColor,
                child: Image.asset("assets/users/person1.png"),
              ),
        const SizedBox(height: 15),
        Text(
          "Mailian Ainstain",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headlineSmall?.color,
              ),
        ),
        Text(
          "@mailian.ainstain",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
        ),
        Expanded(
          child: ListView(
            children: [
              cardProfileWidget(text: 'profile.r1'.tr(), OnTap: null),
              cardProfileWidget(text: 'profile.r2'.tr(), OnTap: null),
              cardProfileWidget(text: 'profile.r3'.tr(), OnTap: null),
              cardProfileWidget(
                text: 'profile.logout'.tr(),
                OnTap: () {
                  showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

  }
}
