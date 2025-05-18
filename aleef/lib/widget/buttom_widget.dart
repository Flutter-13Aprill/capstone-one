import 'package:aleef/extensions/screens/get_size_screen.dart';
import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  /// A custom elevated button widget
  const ButtomWidget({
    super.key,
    required this.onTab,
    required this.textElevatedButton,
  });

  /// Callback for button press
  final Function()? onTab;

  /// Button label
  final String textElevatedButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(context.getWidth() + 200, context.getHeight() / 20),
        ),
      ),
      onPressed: onTab,
      child: Center(
        child: Text(
          textElevatedButton,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
