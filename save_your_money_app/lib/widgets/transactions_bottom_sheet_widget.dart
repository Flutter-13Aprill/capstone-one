import 'package:flutter/material.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';
import 'package:save_your_money_app/widgets/custom_divider_widget.dart';
import 'package:save_your_money_app/widgets/transaction_tile_widget.dart';

class TransactionsBottomSheetWidget extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const TransactionsBottomSheetWidget({super.key, required this.transactions});

  /// A bottom sheet widget that displays a scrollable list of transactions,

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(0.8),
      decoration: BoxDecoration(
        color: Color(0xff252836),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            ...transactions.asMap().entries.map((entry) {
              bool endList = entry.key == transactions.length - 1;
              var transaction = entry.value;
              return Column(
                children: [
                  TransactionTileWidget(
                    name: transaction["name"],
                    time: transaction["time"],
                    amount: transaction["amount"],
                    isIncome: transaction["isIncome"],
                  ),
                  if (!endList) CustomDividerWidget(),
                ],
              );
            }),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
