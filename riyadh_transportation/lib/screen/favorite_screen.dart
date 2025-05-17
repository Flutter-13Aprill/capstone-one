import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/style/app_colors.dart';
import 'package:riyadh_transportation/widget/bus/bus_body.dart';
import 'package:riyadh_transportation/widget/metro/metro_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: 40),
          TabBar(
            dividerHeight: 0,
            indicatorWeight: 10,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            tabs: [
              Container(
                width: 300,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.directions_bus_sharp, color: AppColors.primary),
                    Text("bus", style: TextStyle(fontSize: 16)).tr(),
                  ],
                ),
              ),
              Container(
                width: 300,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.train, color: AppColors.primary),
                    Text("metro", style: TextStyle(fontSize: 16)).tr(),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: TabBarView(children: [BusBody(), MetroWidget()])),
        ],
      ),
    );
  }
}
