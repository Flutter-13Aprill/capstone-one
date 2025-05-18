import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:save_your_money_app/controllers/home_controller.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';
import 'package:save_your_money_app/widgets/bank_card_widget.dart';
import 'package:save_your_money_app/widgets/custom_divider_widget.dart';
import 'package:save_your_money_app/widgets/info_card_widget.dart';
import 'package:save_your_money_app/widgets/list_view_widget.dart';
import 'package:save_your_money_app/widgets/shimmer_bank_card_widget.dart';
import 'package:save_your_money_app/widgets/shimmer_info_card_widget.dart';
import 'package:save_your_money_app/widgets/shimmer_list_view_widget.dart';
import 'package:save_your_money_app/widgets/shimmer_transaction_tile_widget.dart';
import 'package:save_your_money_app/widgets/transaction_tile_widget.dart';
import 'package:save_your_money_app/widgets/transactions_bottom_sheet_widget.dart';
import 'package:save_your_money_app/widgets/translation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// HomeScreen widget displays the main dashboard of the app.
// It shows user greeting, total balance, financial goals, and bank cards with swipe support.
// Uses shimmer widgets for loading placeholders during async data loading (3 seconds simulated).
// Contains horizontal scrollable transaction tabs to filter transactions.
// Shows recent transactions with option to view all via a bottom sheet.
// Uses easy_localization for multi-language support and theming for consistent UI styling.

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();

    // Show shimmer for 3 seconds and then stop
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        controller.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return Scaffold(
      appBar: TranslationWidget(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "hello".tr(),
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Remas Alnugaithan",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.isLoading
                        ? ShimmerInfoCardWidget()
                        : InfoCardWidget(
                          title: 'total_balance'.tr(),
                          value: "70000",
                        ),
                    controller.isLoading
                        ? ShimmerInfoCardWidget()
                        : InfoCardWidget(title: "goal".tr(), value: "100000"),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: context.getWidth(0.9),
                  height: context.getHeight(0.25),
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: 5,
                    onPageChanged: (index) {
                      setState(() {
                        controller.currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            controller.isLoading
                                ? ShimmerBankCardWidget()
                                : BankCardWidget(
                                  cardNumber:
                                      controller.cardData[index]["cardNumber"]!,
                                  expirationDate:
                                      controller
                                          .cardData[index]["expirationDate"]!,
                                  index: index,
                                ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 80,
                    width: 590,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        bool isClicked = index == controller.clickedIndex;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.clickedIndex = index;
                            });
                          },

                          child:
                              controller.isLoading
                                  ? ShimmerListViewWidget()
                                  : ListViewWidget(
                                    icon:
                                        controller
                                            .transactionTabs[index]['icon'],
                                    title:
                                        controller
                                            .transactionTabs[index]['title']
                                            .toString()
                                            .tr(),
                                    isClicked: isClicked,
                                  ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return TransactionsBottomSheetWidget(
                            transactions: controller.transactionsToShow,
                          );
                        },
                      );
                    },
                    child: Text(
                      "view_all".tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    children: [
                      ...controller.transactionsToShow
                          .take(4)
                          .toList()
                          .asMap()
                          .entries
                          .map((entry) {
                            bool endList = entry.key == 3;
                            var transaction = entry.value;
                            return Column(
                              children: [
                                controller.isLoading
                                    ? ShimmerTransactionTileWidget()
                                    : TransactionTileWidget(
                                      name: transaction["name"],
                                      time: transaction["time"],
                                      amount: transaction["amount"],
                                      isIncome: transaction["isIncome"],
                                    ),
                                if (!endList) CustomDividerWidget(),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
