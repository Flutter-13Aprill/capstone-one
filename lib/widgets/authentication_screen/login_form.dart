import 'package:flutter/material.dart';

// -- Widget
import 'package:shabah/widgets/authentication_screen/password_text_form_field.dart';
import 'package:shabah/widgets/authentication_screen/phone_text_form_field.dart';

// - External Package 
import 'package:easy_localization/easy_localization.dart';


class LoginForm extends StatefulWidget {

  /// [LoginForm] A form widget containing phone number and password input fields.
  ///
  /// Validates phone number format and provides password input.
  const LoginForm({super.key, required this.formGlobalKey, required this.phoneTextFieldController, required this.passwordTextFieldController,});

  final GlobalKey<FormState> formGlobalKey;
  final TextEditingController phoneTextFieldController;
  final TextEditingController passwordTextFieldController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formGlobalKey,
      child: Column(
        spacing: 32,
        children: [
          PhoneTextFormField(
            controller: widget.phoneTextFieldController,
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
            controller: widget.passwordTextFieldController,
            labelText: context.tr('password_text'),
          ),
        ],
      ),
    );
  }
}
