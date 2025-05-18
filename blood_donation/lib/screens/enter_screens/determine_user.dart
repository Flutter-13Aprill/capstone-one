
import 'package:blood_donation/widgets/donar_widget/determine_user_widget.dart';
import 'package:flutter/material.dart';

class DetermineUserScreen extends StatefulWidget {
  const DetermineUserScreen({super.key});

  @override
  State<DetermineUserScreen> createState() => _DetermineUserScreenState();
}

class _DetermineUserScreenState extends State<DetermineUserScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DetermineUserWidget());
  }
}



