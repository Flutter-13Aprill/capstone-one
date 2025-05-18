import 'package:capstone1/CustomWidgets/HomeScreen/goals_card.dart';
import 'package:capstone1/CustomWidgets/HomeScreen/transactions_tabs.dart';
import 'package:flutter/material.dart';
import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/Controllers/home_screen_controller.dart';
import 'package:capstone1/CustomWidgets/General/balance_header.dart';
import 'package:capstone1/CustomWidgets/HomeScreen/Drawer/custom_drawer.dart';
import 'package:capstone1/CustomWidgets/white_container.dart';
import 'package:capstone1/Styling/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.balanceHeaderController});
  final BalanceHeaderController balanceHeaderController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final HomeScreenController homeScreenController = HomeScreenController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Three tabs: Daily, Weekly, Monthly
    _tabController = TabController(length: 3, vsync: this);
    // default to Monthly
    _tabController.index = 2;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: darkModeGreen)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () async {
              final didAdd = await homeScreenController.showAddSheet(
                context,
                widget.balanceHeaderController,
              );

              if (didAdd == true) {
                setState(() {});
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // The existing balance header
          BalanceHeader(controller: widget.balanceHeaderController),

          // The big light-green container
          Expanded(
            child: WhiteContainer(
              // Here we pass all the inner content as the `child`
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16), // using The screen extension
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // The top goals card
                    GoalsCard(
                      balanceHeaderController: widget.balanceHeaderController,
                    ),

                    SizedBox(height: 24),

                    // Tab Bar
                    TransactionsTabs(tabController: _tabController),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: backgroundGreenwhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home, size: 32),
            Icon(Icons.bar_chart, size: 32),
            Icon(Icons.swap_horiz, size: 32),
            Icon(Icons.layers, size: 32),
            Icon(Icons.person, size: 32),
          ],
        ),
      ),
    );
  }
}
