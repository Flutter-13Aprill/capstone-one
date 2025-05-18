import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,

    required this.child,
    required this.title,
    this.onTap,
  });
  final Widget child;
  final Widget title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: child, title: title, onTap: onTap);
  }
}
