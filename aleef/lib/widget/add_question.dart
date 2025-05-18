import 'package:aleef/widget/buttom_widget.dart';
import 'package:aleef/widget/text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatelessWidget {
  /// Floating action button widget to add a new question.
  const AddQuestion({super.key, required this.questionController, this.onTab});

  /// Controller to handle the input from the text field.
  final TextEditingController questionController;

  /// Callback function to be triggered when the continue button is pressed.
  final dynamic Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:
          () => showModalBottomSheet(
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
                    Text(
                      "askYourQuestion".tr(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    /// Custom Text Field for entering the question
                    TextFieldWidget(
                      labelText: "questionAsk".tr(),
                      controller: questionController,
                      textHint: "enterQuestionHere".tr(),
                    ),

                    /// Custom Button to submit
                    ButtomWidget(
                      onTab: onTab,
                      textElevatedButton: 'continue'.tr(),
                    ),
                  ],
                ),
              );
            },
          ),

      child: Icon(Icons.add, size: 40),
    );
  }
}
