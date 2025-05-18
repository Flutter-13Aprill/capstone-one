import 'package:blood_donation/exstenshon/exstenshon.dart';
import 'package:blood_donation/screens/DonarRequester/ask_donor_homeScreen.dart';
import 'package:blood_donation/theems/color.dart';
import 'package:blood_donation/widgets/donor_request/card_homa_widget.dart';
import 'package:blood_donation/widgets/donor_request/pages_view.dart';
import 'package:blood_donation/widgets/donor_request/shimmer_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              title: Text("welcome".tr(), style: TextStyle(fontSize: 30)),
              subtitle: Text("dhruv chauhan", style: TextStyle(fontSize: 16)),
              trailing: Image.asset("images/notification icon.png"),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: context.gethight() / 4,
              width: 350,
              child: PageView(
                children: [
                  PagesView(
                    title1: "YOUR  BLOOD",
                    title2: "MAKE SOMEONE HAPPY",
                    images: "images/bloodbag1.png",
                  ),

                  PagesView(
                    title1: "BLOOD DONATION IS A",
                    title2: "GREAT ACT OF KINDNESS",
                    images: "images/blood.png",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              height: 325,

              width: context.getWidth(),
              decoration: BoxDecoration(color: myAppColor.graycolor),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Quick Access:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Wrap(
                    children:
                        isLoading
                            ? List.generate(
                              6,
                              (index) => const ShimmerCardWidget(
                                imagePath: "images/Vector (1).png",
                                text: "Loading...",
                              ),
                            )
                            : [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => AskDonorHomeScreen(),
                                    ),
                                  );
                                },
                                child: CardHomaWidget(
                                  images: "images/Vector (1).png",
                                  text: "find_donor".tr(),
                                ),
                              ),
                              CardHomaWidget(
                                images: "images/chat.png",
                                text: "chat".tr(),
                              ),
                              CardHomaWidget(
                                images: "images/Vector (2).png",
                                text: "campaing".tr(),
                              ),
                              CardHomaWidget(
                                images: "images/Friend Icon (2).png",
                                text: "share".tr(),
                              ),
                              InkWell(
                                onTap: () {
                                  if (context.locale.languageCode == "en") {
                                    context.setLocale(const Locale("ar", "AR"));
                                  } else {
                                    context.setLocale(const Locale("en", "US"));
                                  }
                                },
                                child: CardHomaWidget(
                                  images: "images/answer_15173038 (1).png",
                                  text: "languge".tr(),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CardHomaWidget(
                                  images: "images/log-out.png",
                                  text: "log_out".tr(),
                                ),
                              ),
                            ],
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
