import 'package:flutter/material.dart';

// -- Widgets
import 'package:shabah/widgets/custom_button.dart';
import 'package:shabah/widgets/home_screen/currency.dart';
import 'package:shabah/widgets/home_screen/numbers_people_card.dart';

// -- Controllers
import 'package:shabah/controllers/cart_controller.dart';
import 'package:shabah/controllers/determine_cost.dart';
import 'package:shabah/controllers/service_controller.dart';
import 'package:shabah/main.dart';
import 'package:shabah/controllers/localization_controller.dart';

// -- External Packages
import 'package:easy_localization/easy_localization.dart';

// -- Extensions
import 'package:shabah/extensions/screen_size.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';
import 'package:shabah/widgets/home_screen/services_tab_bar.dart';
import 'package:shabah/widgets/home_screen/services_tab_bar_view.dart';

class HomeScreen extends StatefulWidget {

  /// [HomeScreen] is the main screen of the app after OTP Screen.
  /// 
  /// It displays:
  /// - A localized welcome message including the user's name.
  /// - A tab bar to switch between different service categories.
  /// - A tab bar view showing detailed services for the selected category.
  /// - A selector for the number of people in the group.
  /// - A currency display widget that calculates the cost based on the selected service and group size.
  /// - An "Add to Cart" button which creates a cart entry with the current selections.
  ///
  /// The screen manages its internal state:
  /// - Keeps track of the selected tab index (`_tabBarIndex`).
  /// - Keeps track of the selected number of people (`numberOfPeopleIndex`).
  /// - Keeps track of the selected service index (`serviceIndex`).

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabBarController;

  int _tabBarIndex = 0;
  int numberOfPeopleIndex = 0;
  late int serviceIndex = 0;
  List<int> numberOfPeople = [5, 10, 15, 20];

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);

    // Listen for tab changes when the user swipes between tab views.
    // Update the selected tab index and service index only after the swipe animation completes.
    _tabBarController.addListener(() {
      if (_tabBarController.indexIsChanging == false) {
        setState(() {
          _tabBarIndex = _tabBarController.index;
          serviceIndex = _tabBarController.index;
        });
      }
    });

    ServiceController.context = context;
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(

              children: [
                Align(
                  alignment: LocalizationController.setAlignment(context: context),
                  child: Text(context.tr('welcome_text_in_home_screen',args: [profile.userName],),style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.secondaryColor,),),
                ),
                Align(
                  alignment: LocalizationController.setAlignment(context: context),
                  child: Text(context.tr('subtitle_text_in_home_screen'),style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.normal,),),
                ),

                SizedBox(height: context.getHeight(multiplied: 0.047)),

                SizedBox(
                  width: context.getHeight(),
                  child: ServicesTabBar(
                    controller: _tabBarController,
                    tabBarIndex: _tabBarIndex,
                    onTap: (value) {
                      setState(() {
                        _tabBarIndex = value!;
                        serviceIndex = value;
                      });
                    }
                  )
                ),

                SizedBox(
                  width: context.getWidth(),
                  height: context.getHeight(multiplied: 0.42),
                  child: ServicesTabBarView(controller: _tabBarController)
                ),

                Align(
                  alignment: LocalizationController.setAlignment(context: context),
                  child: Text(context.tr('how_many_of_you'),style: Theme.of(context).textTheme.bodyMedium,),
                ),

                SizedBox(height: context.getHeight(multiplied: 0.012)),

                Row(
                  spacing: 24,
                  children: List.generate(4, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          numberOfPeopleIndex = index;
                        });
                      },
                      child: NumbersPeopleCard(
                        numberOfPeople: ServiceController.getNumberOfPeople(index: index),
                        uniqueIndex: index,
                        selectedIndex: numberOfPeopleIndex,
                      ),
                    );
                  }),
                ),

                SizedBox(height: context.getHeight(multiplied: 0.04)),

                Currency(serviceIndex: serviceIndex, numberOfPeopleIndex: numberOfPeopleIndex,),

                SizedBox(height: context.getHeight(multiplied: 0.04)),

                CustomButton(
                  labelText: context.tr('add_to_cart_text'),
                  onPressed: () {
                    cart = CartController(
                      serviceName: ServiceController.getServiceNameForCart(
                        index: serviceIndex,
                      ),
                      numberOfPeople:
                          numberOfPeople[numberOfPeopleIndex].toString(),
                      finalCost:
                          DetermineCost.getFinalCost(
                            indexOfService: serviceIndex,
                            NumberOfPeople: numberOfPeopleIndex,
                          ).toString(),
                    );
                  },
                ),

                SizedBox(height: context.getHeight(multiplied: 0.05))
              ],
            ),
          ),
        ),
      ),
    );
  }
}