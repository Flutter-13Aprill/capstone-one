import 'package:flutter/material.dart';
import 'package:shabah/controllers/date_picker.dart';
import 'package:shabah/main.dart';
import 'package:shabah/style/app_colors.dart';

class CustomDatePickerTextFormField extends StatefulWidget {
  const CustomDatePickerTextFormField({super.key, required this.labelText,required this.datePickerController, this.onValidate});

  final TextEditingController datePickerController;
  final String labelText;
  final String? Function(String? value)? onValidate;

  @override
  State<CustomDatePickerTextFormField> createState() => _CustomDatePickerTextFormFieldState();
}

class _CustomDatePickerTextFormFieldState extends State<CustomDatePickerTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.datePickerController,
      validator: widget.onValidate,
      onTap: () async {
        widget.datePickerController.text = await DatePicker.selectDate(context);
        date.datePicked = widget.datePickerController.text;
        setState(() {});
      },
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_today_rounded),
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
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
