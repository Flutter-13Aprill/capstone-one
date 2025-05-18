import 'package:blood_donation/theems/color.dart';
import 'package:flutter/material.dart';

class PagesView extends StatelessWidget {
  const PagesView({super.key, required this.title1, required this.title2,required this.images});
  final String title1;
  final String title2;
  final String images;
  @override
  Widget build(BuildContext context) {

    return Card(//this card for the page view
      color: myAppColor.graycolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$title1\n',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: title2,
                            style: TextStyle(
                              color: myAppColor.redcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Read story",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 20),
            Image.asset(
              images,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
