import 'package:flutter/material.dart';

class SubtaskTabTile extends StatefulWidget {
  final List<String> subtasks;

  const SubtaskTabTile({super.key, required this.subtasks});

  @override
  State<SubtaskTabTile> createState() => _SubtaskTabTileState();
}

class _SubtaskTabTileState extends State<SubtaskTabTile> {
  late List<bool> isCheckedList;

  @override
  void initState() {
    super.initState();
    isCheckedList = List.generate(widget.subtasks.length, (index) => false);
  }

  bool _areAllTasksChecked() {
    return isCheckedList.every((checked) => checked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.subtasks.isNotEmpty) ...[
            const Text(
              "Subtasks",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Subtasks List
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(widget.subtasks.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isCheckedList[index] = !isCheckedList[index];
                  });
                },
                child: Chip(
                  label: Text(
                    widget.subtasks[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: isCheckedList[index] ? Colors.grey : Colors.white,
                      decoration: isCheckedList[index] ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  backgroundColor: isCheckedList[index] ? Colors.grey[300] : Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          // Finish Button
          Center(
            child: ElevatedButton(
              onPressed: _areAllTasksChecked()
                  ? () {
                      Navigator.pushNamed(context, '/rewards');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _areAllTasksChecked() ? Colors.purple : Colors.grey[300],
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Finish",
                style: TextStyle(
                  color: _areAllTasksChecked() ? Colors.white : Colors.grey[600],
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


