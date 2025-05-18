import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:capstone1/Styling/colors.dart';

class SimpleBarChart extends StatelessWidget {
  final BalanceHeaderController controller;
  const SimpleBarChart(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch your three doubles
    final income = double.parse(controller.getIncome().replaceAll("\$", ""));
    final expense = double.parse(controller.getExpense().replaceAll("\$", ""));
    final balance = double.parse(controller.getBalance().replaceAll("\$", ""));

    // Build three group entries: one bar each
    final groups = <BarChartGroupData>[
      BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: income, color: mainGreen, width: 20)],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: expense, color: Colors.blueAccent, width: 20),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(toY: balance, color: Colors.black87, width: 20),
        ],
      ),
    ];

    return BarChart(
      BarChartData(
        maxY: [income, expense, balance].reduce((a, b) => a > b ? a : b) * 1.2,
        barGroups: groups,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const labels = ['Income', 'Expense', 'Balance'];
                final idx = value.toInt();
                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    idx >= 0 && idx < labels.length ? labels[idx] : '',
                    style: TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
