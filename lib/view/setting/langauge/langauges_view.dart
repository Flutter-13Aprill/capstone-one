import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/widgets/profile/card_profile_widget.dart';

class LangaugesView extends StatelessWidget {
  const LangaugesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('langauge.title'.tr()),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            cardProfileWidget(text:'langauge.t1'.tr() , OnTap: ()async{
             await context.setLocale(Locale('ar')) ;
            }),
            cardProfileWidget(text: 'langauge.t2'.tr() , OnTap: ()async{
             await context.setLocale(Locale('en')) ;
            }),
          ],
        ),
      ),
    );
  }
}
