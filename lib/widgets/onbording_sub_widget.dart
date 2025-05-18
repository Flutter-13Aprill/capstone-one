import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';

class OnbordingSubWidget extends StatelessWidget {
  const OnbordingSubWidget({super.key, required this.nextPage, required this.title, required this.subTitle, required this.skip});
  final Function nextPage;
  final Function skip;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
      
            style: TextStyle(
              color: AppColors.info,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(height: 42),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                 skip();
                },
                child: Text(
                  "skip",
                  textAlign: TextAlign.left,
      
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  nextPage();
                  // print("next");
                },
                child: Image.asset(
                  width: 129,
                  height: 191,
                  "assets/onBording/Nextbutton.png",
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
