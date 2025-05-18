import 'package:flutter/material.dart';

class ListtileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ListtileWidget({super.key, required this.title, required this.icon});
  // A custom ListTile widget with fixed size, dark background,
  // rounded corners, and light-colored icon and title text.

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 350,
      decoration: BoxDecoration(
        color: Color(0xff252836),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(0xffE2DBD0)),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xffE2DBD0),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
