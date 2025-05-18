import 'package:aleef/style/style_color.dart';
import 'package:aleef/widget/buttom_widget.dart';
import 'package:aleef/widget/text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddPet extends StatelessWidget {
  /// A button that opens a bottom sheet for adding a pet
  const AddPet({
    super.key,
    required this.onChanged,
    required this.onTab,
    required this.item,
    required this.selectedValue,
    required this.petNameController,
  });

  /// Controls the input for the pet's name
  final TextEditingController petNameController;

  /// List of pet types/options for dropdown
  final List<String> item;

  /// Currently selected dropdown value
  final String? selectedValue;

  /// Callback when dropdown value changes
  final ValueChanged<String?> onChanged;

  /// Callback when "Continue" button is pressed
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Shows modal bottom sheet for pet info input
        showModalBottomSheet(
          showDragHandle: true,
          context: context,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),

          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                spacing: 16,
                children: [
                  // Top row with title and dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "choosePets".tr(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        width: 100,
                        // DropdownButton
                        child: DropdownButtonFormField(
                          value: selectedValue,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusColor: StyleColor.clay,
                          ),
                          items:
                              item
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: onChanged,
                        ),
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    labelText: "petNameLabel".tr(),
                    controller: petNameController,
                    textHint: "petNameHint".tr(),
                  ),
                  ButtomWidget(
                    onTab: onTab,
                    textElevatedButton: 'continue'.tr(),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text('addPet'.tr(), style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
