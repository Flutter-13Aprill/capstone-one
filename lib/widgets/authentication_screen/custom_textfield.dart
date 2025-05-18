import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// -- Style
import 'package:shabah/style/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  
  const CustomTextfield({super.key, required this.controller ,required this.labelText, this.onValidate,this.isNoteTextField = false});

  final TextEditingController controller; 
  final String labelText;
  final bool isNoteTextField;
  final String? Function(String? value)? onValidate;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: onValidate,
      keyboardType: TextInputType.text,
      maxLines: isNoteTextField ? 3 : 1,
      maxLength: isNoteTextField ? 120 : null,
      decoration: InputDecoration(

        labelText: labelText,
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
