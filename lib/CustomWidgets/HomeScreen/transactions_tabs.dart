import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class TransactionsTabs extends StatelessWidget {
  TransactionsTabs({super.key, required this.tabController});
  final TabController tabController;
  // Dummy data for the list
  final entries = [
    {
      'icon': Icons.attach_money,
      'title': 'Salary',
      'subtitle': '18:27 · April 30',
      'category': 'Monthly',
      'amount': '\$4,000.00',
    },
    {
      'icon': Icons.shopping_bag,
      'title': 'Groceries',
      'subtitle': '17:00 · April 24',
      'category': 'Pantry',
      'amount': '-\$100.00',
    },
    {
      'icon': Icons.meeting_room,
      'title': 'Rent',
      'subtitle': '8:30 · April 15',
      'category': 'Rent',
      'amount': '-\$674.40',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundGreenwhite,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TabBar(
            controller: tabController,
            labelColor: mainGreen,
            unselectedLabelColor: darkModeGreen,
            indicator: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(50),
            ),
            tabs: const [
              Tab(text: "Daily"),
              Tab(text: "Weekly"),
              Tab(text: "Monthly"),
            ],
          ),
        ),

        SizedBox(height: 16),

        // The list of entries
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: entries.length,
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemBuilder: (context, idx) {
            final e = entries[idx];
            return Row(
              children: [
                // Icon circle
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    e['icon'] as IconData,
                    color: darkModeGreen,
                    size: 24,
                  ),
                ),
                SizedBox(width: 12),
                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['title'] as String,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        e['subtitle'] as String,
                        style: TextStyle(fontSize: 14, color: lightBlue),
                      ),
                    ],
                  ),
                ),
                // Category & amount
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      e['category'] as String,
                      style: TextStyle(fontSize: 14, color: darkModeGreen),
                    ),
                    SizedBox(height: 4),
                    Text(
                      e['amount'] as String,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            (e['amount'] as String).startsWith('-')
                                ? Colors.redAccent
                                : darkModeGreen,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
