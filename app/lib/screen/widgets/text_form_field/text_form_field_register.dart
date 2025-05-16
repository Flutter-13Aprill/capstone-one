import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextFormFieldRegister extends StatefulWidget {
  // Custom TextFormField for registration screens.

  final TextEditingController controller; // Controls the text input.
  final String lable; // Label text for the input field.
  final bool obscureText; // Add an optional obscureText property
  TextFormFieldRegister({
    this.obscureText = false, // Default value for obscureText is false
    super.key,
    required this.controller,
    required this.lable,
  });

  @override
  State<TextFormFieldRegister> createState() => _TextFormFieldRegisterState();
}

class _TextFormFieldRegisterState extends State<TextFormFieldRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8), // Left padding inside the container.
      width: context.getWidth() * .98, // 98% of the screen width.
      height: context.getHeigth() * .09, // 9% of the screen height.
      child: TextFormField(
        obscureText: widget.obscureText, // Use the passed obscureText property
        //check value of input from user
        validator: (value) {
          //if input in email must have spisific format 
          if (widget.lable.tr().toLowerCase() == "email" ||
              widget.lable.tr() == "البريد الالكتروني") {
            if (!RegExp(//use RegExp
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
            ).hasMatch(value!)) {//if value not in way of RegExp the return error 
              return "email is must be like noor@gmail.com";
            }
          }
          // input in password    
          if (widget.lable.tr().toLowerCase() == "password" ||
              widget.lable.tr() == "الرقم السري") {
            if (value == null || value.isEmpty) {
              return "password is required".tr();//password should not be null
            }
            if (value.length < 6) {//assword must be at least 6 characters
              return "password must be at least 6 characters".tr();
            }
            if (!value.contains(RegExp(r'[A-Z]'))) {//password  must contain at least one uppercase letter
              return "password must contain at least one uppercase letter".tr();
            }
            if (!value.contains(RegExp(r'[a-z]'))) {//password must contain at least one lowercase letter
              return "password must contain at least one lowercase letter".tr();
            }
            if (!value.contains(RegExp(r'[0-9]'))) {//"password must contain at least one digit"
              return "password must contain at least one digit".tr();
            }
            if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
              return "password must contain at least one special character"
                  .tr();//password must contain at least one special character
            }
          }
          return null; // Return null if the input is valid
        },
        controller: widget.controller,// The TextEditingController to manage the input.
        decoration: InputDecoration(//make style of text feild 
          focusedBorder: OutlineInputBorder( // Border color when focused.
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 1,
              color: StyleColor.promarySecondBlueColor,
            ),
          ),
          enabledBorder: OutlineInputBorder( // Border color when not focused.
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 2,
              color: StyleColor.primaryTaupeColor,
            ),
          ),
          labelText: widget.lable.tr(),

          labelStyle: Theme.of(context).textTheme.bodyMedium!, // Localized label text.
          hintText: widget.controller.text, // Hint text (initially the controller's text).
          hintStyle: TextStyle(color:StyleColor.primarRedGrayyeColor, fontSize: 10),// Style for the hint text.

        ),
      ),
    );
  }
}
