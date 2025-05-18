import 'package:flutter/material.dart';

// -- Widgets
import 'package:shabah/widgets/authentication_screen/custom_textfield.dart';
import 'package:shabah/widgets/authentication_screen/password_text_form_field.dart';
import 'package:shabah/widgets/authentication_screen/phone_text_form_field.dart';

// -- External Packages
import 'package:easy_localization/easy_localization.dart';

class SignupForm extends StatefulWidget {

  /// [SignupForm] A sign-up form collecting first name, phone number, password, and password confirmation.
  ///
  /// Includes validation for phone format, password length, and password confirmation match.
  const SignupForm({super.key,required this.formGlobalKey,required this.firstNameController,required this.phoneController,required this.passwordController,required this.passwordConfirmationController,});

  final GlobalKey<FormState> formGlobalKey;

  final TextEditingController firstNameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formGlobalKey,
      child: Column(
        spacing: 32,
        children: [
          
          CustomTextfield(
            controller: widget.firstNameController,
            labelText: context.tr('first_name'),
          ),

          PhoneTextFormField(
            controller: widget.phoneController,
            labelText: context.tr('phone_number_textfield'),
            onValidate: (value) {
              if (value!.isEmpty) {
                return context.tr('phone_number_textfield_first_val');
              } else if (!value.startsWith('0')) {
                return context.tr('phone_number_textfield_second_val');
              } else if (!value.startsWith('05')) {
                return context.tr('phone_number_textfield_third_val');
              } else if (value.length < 10) {
                return context.tr('phone_number_textfield_fourth_val');
              }
              return null;
            },
          ),

          PasswordTextFormField(
            controller: widget.passwordController,
            labelText: context.tr('password_text'),
            onValidate: (value) {
              if (value!.length <= 5) {
                return context.tr('password_textfield_first_val');
              }
              return null;
            },
          ),

          PasswordTextFormField(
            controller: widget.passwordConfirmationController,
            labelText: context.tr('confirm_your_password'),
            onValidate: (value) {
              final firstPassword = widget.passwordController.text;
              final secondPassword = widget.passwordConfirmationController.text;
              if (firstPassword != secondPassword && secondPassword.isNotEmpty) {
                return context.tr('password_confirmation_textfield_first_val');
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
