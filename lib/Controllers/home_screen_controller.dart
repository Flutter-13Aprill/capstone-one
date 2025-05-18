import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/CustomWidgets/HomeScreen/expense_tab.dart';
import 'package:capstone1/CustomWidgets/HomeScreen/income_tab.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class HomeScreenController {
  Future<bool?> showAddSheet(
    BuildContext sheetContext,
    BalanceHeaderController balanceHeaderController,
  ) {
    return showModalBottomSheet<bool>(
      showDragHandle: true,
      context: sheetContext,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: backgroundGreenwhite,
      builder: (BuildContext context) {
        final expenseController = TextEditingController();
        final incomeController = TextEditingController();
        return SizedBox(
          height: context.screenHeight * 0.6,
          child: DefaultTabController(
            length: 2,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  TabBar(
                    tabs: const [Tab(text: 'Expense'), Tab(text: 'Income')],
                    labelColor: darkModeGreen,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: mainGreen,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Expense Tab
                        ExpenseTab(
                          expenseController: expenseController,
                          sheetContext: sheetContext,
                          balanceHeaderController: balanceHeaderController,
                        ),
                        // Income Tab
                        IncomeTab(
                          incomeController: incomeController,
                          sheetContext: sheetContext,
                          balanceHeaderController: balanceHeaderController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
