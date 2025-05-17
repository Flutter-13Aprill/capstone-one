import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    required this.press,
    required this.child,
    required this.width,
    required this.height,
  });
  final VoidCallback press;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: child,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        fixedSize: WidgetStateProperty.all(Size(width, height)),
      ),
    );
  }
}
