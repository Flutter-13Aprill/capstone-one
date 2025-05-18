import 'package:flutter/material.dart';
import 'package:pie_chart_sz/ValueSettings.dart';
import 'package:pie_chart_sz/pie_chart_sz.dart';
import 'package:project_flow/controllers/home_view_controller.dart';
import 'package:project_flow/models/label.dart';
import 'package:project_flow/models/project.dart';
import 'package:project_flow/widgets/labels_widget.dart';


class ChartProjectWidget extends StatelessWidget {
  ChartProjectWidget({super.key, required this.project});
  final Project project;

  List<Color>? colors = [
    Colors.purple,
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.teal,
  ];

  List<double>? values = [50, 20, 20, 5, 5];

  @override
  Widget build(BuildContext context) {
    HomeViewController controller = HomeViewController();
    Set<LabelOptions> labels = controller.getListOfLabelTake(project.task);
    return Column(
      children: [
        PieChartSz(
          colors: colors,
          values: values,
          gapSize: 0.20,
          centerText: project.title,
          centerTextStyle: Theme.of(context).textTheme.displaySmall!,
          valueSettings: Valuesettings(
            showValues: true,
            ValueTextStyle:Theme.of(context).textTheme.labelSmall,
          ),
        ),
        // show labels
        LabelsWidget(labels:labels )
      ],
    );
  }
}
