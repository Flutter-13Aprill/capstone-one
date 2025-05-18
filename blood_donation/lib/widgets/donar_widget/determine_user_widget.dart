import 'package:flutter/material.dart';
import 'package:blood_donation/screens/enter_screens/log_in_screen.dart';
import 'package:blood_donation/theems/color.dart';
import 'package:blood_donation/widgets/enter_widget/background_theem.dart';
import 'package:easy_localization/easy_localization.dart';

class DetermineUserWidget extends StatelessWidget {
  const DetermineUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BackgroundTheem(),
        const SizedBox(height: 70),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(300, 45),
            backgroundColor: myAppColor.graycolor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInScreen(name: "Donar"),
              ),
            );
          },
          child: Text(
            "donor_button".tr(),
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(300, 45),
            backgroundColor: myAppColor.graycolor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInScreen(name: "Not Donar"),
              ),
            );
          },
          child: Text(
            "find_donars_button".tr(),
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
