import 'package:flutter/material.dart';

// -- External Package
import 'package:easy_localization/easy_localization.dart';

// App theme
import 'package:shabah/style/app_colors.dart';

// ignore: must_be_immutable
class RememberMeAndForgotPassword extends StatefulWidget {

  /// [RememberMeAndForgotPassword] A widget showing a "Remember Me" checkbox and a "Forgot Your Password" label.
  ///
  /// Manages the checkbox state internally and updates when toggled.
  RememberMeAndForgotPassword({super.key,required this.isKeepRememberMe,});

  bool isKeepRememberMe;

  @override
  State<RememberMeAndForgotPassword> createState() =>_RememberMeAndForgotPasswordState();
}

class _RememberMeAndForgotPasswordState
    extends State<RememberMeAndForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: widget.isKeepRememberMe,
              checkColor: Colors.white,
              activeColor: AppColors.tertiaryColor,
              onChanged: (value) {
                setState(() {
                  widget.isKeepRememberMe = value!;
                });
              },
            ),

            Text(
              context.tr('remember_me'),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),

        Text(
          context.tr('forgot_your_password'),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Color.fromRGBO(74, 73, 71, 0.5),
          ),
        ),
      ],
    );
  }
}
