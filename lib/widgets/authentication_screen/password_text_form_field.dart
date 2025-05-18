import 'package:flutter/material.dart';

// -- App theme
import 'package:shabah/style/app_colors.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key,required this.controller,required this.labelText,this.onValidate,});
  final TextEditingController controller;
  final String labelText;
  final String? Function(String? value)? onValidate;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isShowPassword,
      validator: widget.onValidate,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
          child: Icon(
            isShowPassword ?  Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Color(0xff7F7F7F)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),
      ),
    );
  }
}
