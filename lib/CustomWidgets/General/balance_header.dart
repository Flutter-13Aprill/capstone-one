// lib/widgets/categories_header.dart

import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/CustomWidgets/General/label_value.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BalanceHeader extends StatefulWidget {
  final BalanceHeaderController controller;

  const BalanceHeader({super.key, required this.controller});

  @override
  State<BalanceHeader> createState() => _BalanceHeaderState();
}

class _BalanceHeaderState extends State<BalanceHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ─── BALANCE & EXPENSE CARD ──────────────
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelValue(
                    label: 'Total Balance',
                    value: widget.controller.getBalance(),
                    valueColor: Colors.white,
                  ),
                  SizedBox(width: context.screenWidth * 0.05),
                  SizedBox(
                    height: context.screenHeight * 0.05,
                    child: VerticalDivider(color: Colors.white, thickness: 1),
                  ),
                  SizedBox(width: context.screenWidth * 0.05),

                  LabelValue(
                    label: 'Total Expense',
                    value: widget.controller.getExpense(),
                    valueColor: oceanBlue,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ─── PROGRESS BAR ────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: LinearPercentIndicator(
                  lineHeight: context.screenHeight * 0.028,
                  barRadius: Radius.circular(13.5),
                  percent: widget.controller.getProgressPercent(),
                  backgroundColor: Colors.white,
                  progressColor: Colors.black,
                  center: Text(
                    "${(widget.controller.getProgressPercent() * 100).toStringAsFixed(0)}%",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.controller.getGoalAmount(),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              // ─── CHECKBOX LINE ───────────────────
              Row(
                children: [
                  const Icon(Icons.check_box, color: Colors.black, size: 18),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      widget.controller.getProgressLabel(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
