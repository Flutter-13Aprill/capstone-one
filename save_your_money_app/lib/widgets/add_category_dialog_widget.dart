import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';

class AddCategoryDialogWidget extends StatelessWidget {
  final TextEditingController categoryController;
  final TextEditingController budgetController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onAdd;
  final VoidCallback onCancel;

  const AddCategoryDialogWidget({
    super.key,
    required this.categoryController,
    required this.budgetController,
    required this.formKey,
    required this.onAdd,
    required this.onCancel,
  });
  // Dialog widget for adding a category with name and budget fields.

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        "add_new_category".tr(),
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: context.getHeight(0.15),
        width: context.getWidth(0.5),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Color(0xffE2DBD0)),
                controller: categoryController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  label: Text(
                    'category_name'.tr(),
                    style: TextStyle(color: Color(0xffE2DBD0)),
                  ),
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                style: TextStyle(color: Color(0xffE2DBD0)),
                controller: budgetController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  label: Text(
                    'budget_amount'.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            "cancel".tr(),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: onAdd,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Text(
            "add".tr(),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
