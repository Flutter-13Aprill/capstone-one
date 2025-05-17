import 'package:capstone/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text(
            "my_requests".tr(),
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryRed,
            ),
          ),
          bottom: TabBar(
            labelColor: AppColors.primaryRed,
            unselectedLabelColor: AppColors.deepGrey,
            indicatorColor: AppColors.primaryRed,
            tabs: [
              Tab(text: "active".tr()),
              Tab(text: "past".tr()),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ReservationsList(type: "active"),
            ReservationsList(type: "past"),
          ],
        ),
      ),
    );
  }
}

class ReservationsList extends StatelessWidget {
  final String type;
  const ReservationsList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> data = type == "active"
        ? [
            {
              "donor": "dominos",
              "date": tr("today_date"),
              "portions": tr("portion_2"),
              "price": tr("free"),
              "note": tr("thanks_note"),
            },
          ]
        : [
            {
              "donor": "Al-Romansiah Restaurant",
              "date": tr("yesterday_date"),
              "portions": tr("portion_1"),
              "price": "4 SAR",
              "note": null
            },
            {
              "donor": "Maesro",
              "date": "May 10",
              "portions": tr("portion_3"),
              "price": tr("free"),
              "note": tr("saved_meals_note")
            },
          ];

    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (_, __) => Divider(color: Colors.grey[300]),
      itemBuilder: (context, index) {
        final item = data[index];
        final isFree = item["price"] == tr("free");

        return ListTile(
          title: Text(
            item["donor"],
            style: theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item["date"], style: theme.textTheme.bodyMedium),
              Text(item["portions"], style: theme.textTheme.bodyMedium),
              if (item["note"] != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    item["note"],
                    style: const TextStyle(color: Colors.green),
                  ),
                )
            ],
          ),
          trailing: Text(
            item["price"],
            style: theme.textTheme.bodyLarge!.copyWith(
              color: isFree ? Colors.green : theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
