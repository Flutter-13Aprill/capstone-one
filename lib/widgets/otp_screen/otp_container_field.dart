import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// -- Extensions
import 'package:shabah/extensions/screen_size.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

class OtpContainerField extends StatelessWidget {

  /// [OtpContainerField] A reusable OTP input box widget designed for single digit input.
  ///
  /// This widget uses a [TextFormField] constrained to accept only one numeric character.
  /// 
  /// It supports focus management, validation, input change handling, submission, and saving callbacks.
  ///
  /// The size is responsive, based on screen height, to maintain a consistent square shape.
  /// 
  /// The text is centered with a large cursor for better visibility.
  /// 
  /// Input is limited to digits only and a maximum length of one character.
  const OtpContainerField({super.key, required this.focus ,required this.controller, this.onChanged, this.onValidator, this.onSubmitted, this.onSaved});

  final FocusNode focus;
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  final String? Function(String?)?  onValidator;
  final void Function(String value)? onSubmitted;
  final void Function(String? value)? onSaved;

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight(multiplied: 0.07),
      width: context.getHeight(multiplied: 0.07),
      child: TextFormField(
        focusNode: focus,
        controller: controller,
        onChanged: onChanged,
        validator: onValidator,
        onSaved: onSaved,
        onFieldSubmitted: onSubmitted,
        
        decoration: InputDecoration(
          hintText: '0',
          hintStyle: TextStyle(
            color: Colors.grey
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        cursorColor: AppColors.secondaryColor,
        cursorHeight: 36,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        

      ),
    );
  }
}
