import 'package:capstone/extensions/size.dart';
import 'package:flutter/material.dart';

//containers for profile options

class ProfileContainers extends StatelessWidget {
  const ProfileContainers({
    super.key,
    required this.setOption,
    required this.setIcon,
    required this.setIconColor,
     this.onPressed,
  });
  final String setOption;
  final Icon setIcon;
  final Color setIconColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPressed,
      child: Container(
        width: context.getWidth() * 0.6,
        height: context.getHieght() * 0.055,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: setIconColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: setIcon,
            ),
            Text(setOption, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
