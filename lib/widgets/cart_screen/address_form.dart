import 'package:flutter/material.dart';

// -- Widget
import 'package:shabah/widgets/authentication_screen/custom_textfield.dart';

// -- External Package 
import 'package:easy_localization/easy_localization.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({
    super.key,
    required this.formKey,
    required this.cityController,
    required this.areaController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController cityController;
  final TextEditingController areaController;

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: 12,
        children: [
          CustomTextfield(
            controller: widget.cityController,
            labelText: context.tr('city_text'),
            onValidate: (value) {
              if (value!.isEmpty) {
                return context.tr('city_textfield_first_val');
              } else if (value.toLowerCase() != 'hail' && value != 'حايل'.trim() &&value != 'حائل'.trim()) {
                return context.tr('city_textfield_second_val');
              }
              return null;
            },
          ),
          CustomTextfield(
            controller: widget.areaController,
            labelText: context.tr('area_text'),
            onValidate: (value) {
              if (value!.isEmpty) {
                return context.tr('area_textfield_first_val');
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
