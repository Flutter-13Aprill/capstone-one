import 'package:flutter/material.dart';

// -- Widgets
import 'package:shabah/widgets/custom_date_picker_text_form_field.dart';

// -- External Package
import 'package:easy_localization/easy_localization.dart';

class DatePickerForm extends StatefulWidget {
  const DatePickerForm({super.key, required this.formKey, required this.controller});

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  State<DatePickerForm> createState() => _DatePickerFormState();
}

class _DatePickerFormState extends State<DatePickerForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: CustomDatePickerTextFormField(
        labelText: context.tr('date_text'),
        datePickerController: widget.controller,
        onValidate: (value) {
          if (widget.controller.text.isEmpty) {
            return context.tr('date_picker_textfield_val');
          }
          return null;
        },
      ),
    );
  }
}
