import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone/controller/meal_controller.dart';
import 'package:capstone/style/colors.dart';
import 'package:capstone/screen/review_meal_screen.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final controller = MealController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hintKey) {
    return InputDecoration(
      hintText: hintKey.tr(),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  void _submitMeal() {
    if (_formKey.currentState!.validate()) {
      final mealData = {
        'name': controller.nameController.text,
        'description': controller.descriptionController.text,
        'portions': controller.portionsController.text,
        'price': controller.priceController.text,
        'availableUntil': controller.timeController.text,
        'location': controller.locationController.text,
      };

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ReviewMealScreen(mealData: mealData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('add_meal'.tr(),
            style: TextStyle(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('meal_name'.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.nameController,
                decoration: _inputDecoration("hint_meal_name"),
                validator: (value) => value!.isEmpty ? 'required'.tr() : null,
              ),
              const SizedBox(height: 16),
              Text('description'.tr()),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.descriptionController,
                maxLines: 3,
                decoration: _inputDecoration("hint_description"),
                validator: (value) => value!.isEmpty ? 'required'.tr() : null,
              ),
              const SizedBox(height: 16),
              Text('number_of_portions'.tr()),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.portionsController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("hint_portions"),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'required'.tr();
                  if (int.tryParse(value) == null) return 'valid_number'.tr();
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text('price_sar'.tr()),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("hint_price"),
                validator: (value) {
                  if (value != null &&
                      value.isNotEmpty &&
                      num.tryParse(value) == null) {
                    return 'valid_number'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text('available_until'.tr()),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.timeController,
                decoration: _inputDecoration("hint_time"),
                validator: (value) => value!.isEmpty ? 'required'.tr() : null,
              ),
              const SizedBox(height: 16),
              Text('location'.tr()),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.locationController,
                decoration: _inputDecoration("hint_location"),
                validator: (value) => value!.isEmpty ? 'required'.tr() : null,
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitMeal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 20),
                  ),
                  child: Text(
                    "share_meal".tr(),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
