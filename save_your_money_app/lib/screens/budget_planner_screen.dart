import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:save_your_money_app/controllers/budget_planner_controller.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:save_your_money_app/widgets/add_category_dialog_widget.dart';
import 'package:save_your_money_app/widgets/translation_widget.dart';

class BudgetPlannerScreen extends StatefulWidget {
  const BudgetPlannerScreen({super.key});

  @override
  State<BudgetPlannerScreen> createState() => _BudgetPlannerScreenState();
}
// BudgetPlannerScreen widget manages and displays the user's budget planning interface.
// It shows total monthly budget and spent amounts with circular percentage indicators.
// Uses BudgetPlannerController to handle budget data and random usage values.
// Supports adding new budget categories via a dialog form.
// Utilizes easy_localization for translating text labels.
// Responsive UI with grid layout for individual budget categories and theming support.

class _BudgetPlannerScreenState extends State<BudgetPlannerScreen> {
  final _keyForm = GlobalKey<FormState>();
  BudgetPlannerController controller = BudgetPlannerController();

  @override
  void initState() {
    super.initState();
    controller.generateRandomUsed();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.usedAmounts.length != controller.category.length) {
      controller.generateRandomUsed();
    }

    double totalBudget = controller.category.fold(
      0,
      (sum, item) => sum + (double.tryParse(item["budget"].toString()) ?? 0),
    );
    double totalUsed = controller.usedAmounts.fold(0, (sum, val) => sum + val);
    double percent = (totalUsed / totalBudget).clamp(0.0, 1.0);

    return Scaffold(
      appBar: TranslationWidget(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: context.getHeight(0.25),
                      width: context.getWidth(0.45),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "monthly_budget".tr(),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            totalBudget.toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: context.getHeight(0.25),
                      width: context.getWidth(0.45),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "spent".tr(),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12),
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 16.0,
                            percent: percent,
                            center: Text(
                              "${(percent * 100).toStringAsFixed(0)}%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            progressColor: Theme.of(context).primaryColor,
                            backgroundColor: Colors.grey.shade800,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                          SizedBox(height: 12),
                          Text(
                            totalUsed.toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.80,
                  ),
                  itemCount: controller.category.length,
                  itemBuilder: (context, index) {
                    final item = controller.category[index];
                    double total =
                        double.tryParse(item["budget"].toString()) ?? 1.0;

                    double used =
                        (controller.usedAmounts.length > index)
                            ? controller.usedAmounts[index]
                            : 0;

                    return Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                item["name"]!,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 16.0,
                              percent: (used / total).clamp(0.0, 1.0),
                              center: Text(
                                "${((used / total) * 100).toStringAsFixed(0)}%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              progressColor:
                                  controller.colors[index %
                                      controller.colors.length],
                              backgroundColor: Colors.grey.shade800,
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "${tr('budget')}: ${total.toStringAsFixed(0)}\n${tr('spent')}: ${used.toStringAsFixed(0)}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.categoryController.clear();
          controller.budgetController.clear();
          showDialog(
            context: context,
            builder:
                (context) => AddCategoryDialogWidget(
                  categoryController: controller.categoryController,
                  budgetController: controller.budgetController,
                  formKey: _keyForm,
                  onCancel: () => Navigator.pop(context),
                  onAdd: () {
                    if (_keyForm.currentState!.validate()) {
                      controller.category.add({
                        "name": controller.categoryController.text,
                        "budget": controller.budgetController.text,
                      });
                      controller.generateRandomUsed();
                      Navigator.pop(context);
                      setState(() {});
                    }
                  },
                ),
          );
        },
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}
