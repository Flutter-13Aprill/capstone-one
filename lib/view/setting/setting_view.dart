import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/style/my_style.dart';
import 'package:project_flow/view/setting/about/about_view.dart';
import 'package:project_flow/view/setting/langauge/langauges_view.dart';
import 'package:project_flow/widgets/profile/card_profile_widget.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StyleApp.sizeH40,
            Expanded(
              child: ListView(
                children: [
                  cardProfileWidget(
                      text: 'setting.t1'.tr(), OnTap: null, isSwitch: true),
                  cardProfileWidget(text: 'setting.t2'.tr(), OnTap: null),
                  cardProfileWidget(text: 'setting.t3'.tr(), OnTap: null),
                  cardProfileWidget(
                      text: 'setting.t4'.tr(),
                      OnTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LangaugesView(),
                            ));
                      }),
                  cardProfileWidget(
                      text: 'setting.t5'.tr(),
                      OnTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutView(),
                            ));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
