import 'package:capstone/extensions/size.dart';
import 'package:capstone/screens/number_game.dart';
import 'package:capstone/widgets/containers/games_shimmer.dart';
import 'package:capstone/widgets/containers/home_containers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isShimmer = true;

//here shows the user the recently played games and the games tha avilable


class _HomeScreenState extends State<HomeScreen> {

@override
  void initState() {
    super.initState();
    
//for shimmer to stay 2 seconds
      Future.delayed(Duration(seconds: 2),(){
        isShimmer = false;
        setState(() {
          
        });
      });

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //drawer
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 172, 173, 173),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'drawerTitle'.tr(),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 36, 36, 36),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: const Color.fromARGB(255, 75, 68, 85),
                ),
                title: Text(
                  'drawerSuggestion'.tr(),
                  style: TextStyle(color: const Color.fromARGB(255, 36, 36, 36)),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.dollarSign,
                  color: const Color.fromARGB(255, 75, 68, 85),
                ),
                title: Text('drawerSubs'.tr(), style: TextStyle(color: const Color.fromARGB(255, 36, 36, 36))),
              ),
              ListTile(
                leading: Icon(
                  Icons.people_alt,
                  color: const Color.fromARGB(255, 75, 68, 85),
                ),
                title: Text('drawerPartners'.tr(), style: TextStyle(color: const Color.fromARGB(255, 36, 36, 36))),
              ),
              ListTile(
                leading: Icon(
                  Icons.health_and_safety_sharp,
                  color: const Color.fromARGB(255, 75, 68, 85),
                ),
                title: Text('drawerHelp'.tr(), style: TextStyle(color: const Color.fromARGB(255, 36, 36, 36))),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(FontAwesomeIcons.bars, color: Colors.white),
              );
            },
          ),
          title: Text('appbarHome'.tr(),),
        ),
        body: Center(
          child: Container(
            width: context.getWidth() * 0.875,
            child: SingleChildScrollView(
              //here is recently played with numbers game
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('recently'.tr(), style: TextStyle(fontSize: 18)),
                  Container(
                    width: context.getWidth(),
                    height: context.getHieght() * 0.2,
                    child: TabBar(
                      indicator: BoxDecoration(color: Colors.transparent),
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: [
                        isShimmer?  GamesShimmer():HomeContainers(
                          setImage: Image.asset(
                            'assets/images/numberg.png',
                          ),
                          setTitle: 'numbersGame'.tr(),
                          widgetPath: NumberGame(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  //here is the games that are avilable or coming soon
                  Text('games'.tr(), style: TextStyle(fontSize: 18)),
                  Container(
                    height: context.getHieght() * 0.75,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      children: [
                        isShimmer?  GamesShimmer():HomeContainers(
                          setImage: Image.asset(
                            'assets/images/numberg.png',
                          ),
                          setTitle: 'numbersGame'.tr(),
                          widgetPath: NumberGame(),
                        ),
                        ...List.generate(
                          5,
                          (index) => isShimmer?  GamesShimmer():HomeContainers(
                            setImage: Icon(Icons.lock),
                            setColor: Colors.grey,
                            setTitle: 'soon'.tr(),
                            isLocked: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
