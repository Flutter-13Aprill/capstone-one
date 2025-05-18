import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/features/home/presentation/widget/edit_button.dart';

class ReceiptGradeView extends StatelessWidget {
  const ReceiptGradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        childAspectRatio: 0.70,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: context.getHeight() * 0.30,
          width: context.getWidth() * 0.50,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    "asset/image/onboarding2.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  title: Text("CenterPoint"),
                  subtitle: Text("1 year left"),

                  trailing: EditButton(text: 'Edit', onPressed: () {}),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
