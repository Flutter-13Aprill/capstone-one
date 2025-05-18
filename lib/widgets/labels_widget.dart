import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {
  const LabelsWidget({super.key, required this.labels});
  final Set<Enum> labels;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...labels.map((item) {
            return Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              margin: const EdgeInsets.only(top: 24, left: 8),
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  item.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
