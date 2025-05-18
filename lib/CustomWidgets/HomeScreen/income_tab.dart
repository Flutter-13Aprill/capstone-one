import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class IncomeTab extends StatefulWidget {
  const IncomeTab({
    super.key,
    required this.incomeController,
    required this.sheetContext,
    required this.balanceHeaderController,
  });
  final TextEditingController incomeController;
  final BuildContext sheetContext;
  final BalanceHeaderController balanceHeaderController;

  @override
  State<IncomeTab> createState() => _IncomeTabState();
}

class _IncomeTabState extends State<IncomeTab> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                final amount = double.tryParse(value);
                if (amount == null || amount <= 0) {
                  return 'Please enter a valid amount';
                }
                return null;
              },
              controller: widget.incomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: darkModeGreen, fontSize: 16),

                fillColor: lightGreen,
                filled: true,

                labelText: 'Amount (USD)',
                prefixText: r'$ ',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  final amount = widget.incomeController.text;
                  widget.balanceHeaderController.addIncome(amount);

                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        backgroundColor: backgroundGreenwhite,
                        title: const Text('Income Added'),
                        content: Text('Income of \$$amount added'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // 2) close the sheet and return `true`
                              Navigator.of(widget.sheetContext).pop(true);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainGreen,
                fixedSize: Size(
                  context.screenWidth * 0.5,
                  context.screenHeight * 0.04,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text('Add Income', style: TextStyle(color: darkModeGreen)),
            ),
          ],
        ),
      ),
    );
  }
}
