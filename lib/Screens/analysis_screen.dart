import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/CustomWidgets/AnalysisScreen/simple_bar_chart.dart';
import 'package:capstone1/CustomWidgets/AnalysisScreen/summary_widget.dart';
import 'package:capstone1/CustomWidgets/General/balance_header.dart';
import 'package:capstone1/CustomWidgets/white_container.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key, required this.balanceHeaderController});
  final BalanceHeaderController balanceHeaderController;

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bd = widget.balanceHeaderController;
    final totalIn = double.parse(bd.getIncome().replaceAll("\$", ""));
    final totalEx = double.parse(bd.getExpense().replaceAll("\$", ""));

    return Column(
      children: [
        SizedBox(height: context.screenHeight * 0.1),

        // ─── BALANCE HEADER ────────────────────
        BalanceHeader(controller: bd),

        // ─── MAIN CARD ────────────────────────
        Expanded(
          child: WhiteContainer(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ─── Tab Bar ───────────────────────
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundGreenwhite,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: mainGreen,
                      unselectedLabelColor: darkModeGreen,
                      indicator: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      tabs: const [
                        Tab(text: 'Daily'),
                        Tab(text: 'Weekly'),
                        Tab(text: 'Monthly'),
                        Tab(text: 'Year'),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  // ─── Simple Bar Chart ───────────────
                  SizedBox(
                    height: context.screenHeight * 0.3,
                    child: SimpleBarChart(bd),
                  ),

                  SizedBox(height: 16),

                  // ─── Income & Expense summary ──────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SummaryItem(
                        icon: Icons.arrow_upward,
                        label: 'Income',
                        amount: '\$${totalIn.toStringAsFixed(2)}',
                        color: mainGreen,
                      ),
                      SummaryItem(
                        icon: Icons.arrow_downward,
                        label: 'Expense',
                        amount: '\$${totalEx.toStringAsFixed(2)}',
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
