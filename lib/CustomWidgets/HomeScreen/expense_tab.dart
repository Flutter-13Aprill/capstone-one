import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class ExpenseTab extends StatefulWidget {
  const ExpenseTab({
    super.key,
    required this.expenseController,
    required this.sheetContext,
    required this.balanceHeaderController,
  });
  final TextEditingController expenseController;
  final BuildContext sheetContext;
  final BalanceHeaderController balanceHeaderController;

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
              controller: widget.expenseController,
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
                if (formKey.currentState!.validate()) {
                  final amount = widget.expenseController.text;
                  widget.balanceHeaderController.addExpense(amount);
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        backgroundColor: backgroundGreenwhite,
                        title: const Text('Expense Added'),
                        content: Text('Expense of \$$amount added'),
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
              child: Text(
                'Add Expense',
                style: TextStyle(color: darkModeGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
