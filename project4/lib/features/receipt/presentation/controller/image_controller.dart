import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project4/core/widget/custom_text_form_field.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/data/repositories/receipt_api_recognizer.dart';

class ImageController {
  final TextEditingController supplierNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController receiptNumberController = TextEditingController();
  final TextEditingController documentTypeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController subcategoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController totalNetController = TextEditingController();
  final TextEditingController totalTaxController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  final cameraImage = (ImageSource.camera);
  final galleryImage = (ImageSource.gallery);
  XFile? selectedImage;

  Future<String?> getImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage = image;
      final file = File(image.path);
      final result = await ReceiptApiRecognizer.analyzeReceipt(imageFile: file);
      return result;
    } else {
      return null;
    }
  }

  void fillReceiptFields(ReceiptModel receipt) {
    supplierNameController.text = receipt.supplierName!;
    phoneNumberController.text = receipt.phoneNumber!;
    receiptNumberController.text = receipt.receiptNumber!;
    documentTypeController.text = receipt.documentType!;
    categoryController.text = receipt.category!;
    subcategoryController.text = receipt.subcategory!;
    dateController.text = receipt.date!;
    timeController.text = receipt.time!;
    totalAmountController.text = receipt.totalAmount!;
    totalNetController.text = receipt.totalNet!;
    totalTaxController.text = receipt.totalTax!;
    currencyController.text = receipt.currency!;
  }

  List<Widget> buildTextFields() {
    return [
      CustomTextFormField(
        controller: supplierNameController,
        labelText: "Supplier Name",
      ),
      CustomTextFormField(
        controller: phoneNumberController,
        labelText: "Phone Number",
      ),
      CustomTextFormField(
        controller: receiptNumberController,
        labelText: "Receipt Number",
      ),
      CustomTextFormField(
        controller: documentTypeController,
        labelText: "Document Type",
      ),
      CustomTextFormField(
        controller: categoryController,
        labelText: "Category",
      ),
      CustomTextFormField(
        controller: subcategoryController,
        labelText: "Subcategory",
      ),
      CustomTextFormField(controller: dateController, labelText: "Date"),
      CustomTextFormField(controller: timeController, labelText: "Time"),
      CustomTextFormField(
        controller: totalAmountController,
        labelText: "Total Amount",
      ),
      CustomTextFormField(
        controller: totalNetController,
        labelText: "Total Net",
      ),
      CustomTextFormField(
        controller: totalTaxController,
        labelText: "Total Tax",
      ),
      CustomTextFormField(
        controller: currencyController,
        labelText: "Currency",
      ),
    ];
  }
}
