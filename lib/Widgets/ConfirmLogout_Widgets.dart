import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // Required for tr()

class ConfirmlogoutWidgets extends StatelessWidget {
  final VoidCallback onLogout;

  const ConfirmlogoutWidgets({Key? key, required this.onLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF2D2B40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      title: Row(
        children: [
          const Icon(Icons.logout, color: Colors.redAccent),
          const SizedBox(width: 10),
          Text(
            'logout_title'.tr(), // Translated title
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
      content: Text(
        'logout_confirmation'.tr(), // Translated content
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'cancel'.tr(), // Translated cancel
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onLogout();
          },
          child: Text(
            'logout'.tr(), // Translated logout
            style: const TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
