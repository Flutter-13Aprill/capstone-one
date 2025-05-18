import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry/screen/bottom_nav_bar%20copy.dart';
import 'package:laundry/screen/cart_screen.dart';
import 'package:laundry/widget/custom_container.dart';

class LaundryScreen extends StatefulWidget {
  const LaundryScreen({
    super.key,
    required this.imagePath,
    required this.laundryName,
    required this.laundryDiscrib,

    required this.logoPath,
    required this.time,
    required this.distance,
  });
  final String imagePath;

  final String laundryName;
  final String laundryDiscrib;
  final String logoPath;
  final String time;
  final String distance;

  @override
  State<LaundryScreen> createState() => _LaundryScreenState();
}

class _LaundryScreenState extends State<LaundryScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // List<String> cart = [];
    return DefaultTabController(
      length: 4, //tabbar length
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        widget.imagePath,
                        height: 250,
                        width: 430,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        //to adjust the container
                        padding: const EdgeInsets.only(left: 16, top: 170.0),
                        child: Container(
                          height: 160,
                          width: 380,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.transparent,
                              ),
                            ],
                            color: const Color.fromARGB(250, 255, 255, 255),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavBar(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24.0, top: 32),
                          child: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ),
                      Padding(
                        //to adjust the logo
                        padding: const EdgeInsets.only(left: 30.0, top: 175),
                        child: Image.asset(
                          widget.logoPath,
                          height: 60,
                          width: 60,
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 55.0,
                              top: 190,
                            ),
                            child: Text(
                              widget.laundryName,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          //---------------------
                          Padding(
                            padding: const EdgeInsets.only(left: 55.0),
                            child: Text(widget.laundryDiscrib),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.clock,
                                  color: Color.fromARGB(255, 147, 147, 121),
                                ),
                                SizedBox(width: 10),

                                Text(widget.time),
                                SizedBox(width: 40),
                                Icon(
                                  Icons.location_on,
                                  color: Color.fromARGB(255, 147, 147, 121),
                                ),
                                SizedBox(width: 10),

                                Text(widget.distance),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    //tabbar package
                    padding: const EdgeInsets.only(top: 20, right: 16),
                    child: Container(
                      height: kToolbarHeight - 12.0,
                      width: 316,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 245, 245, 220),
                      ),

                      child: ButtonsTabBar(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 245, 220),
                          // border: Border.all(
                          //   // color: const Color.fromARGB(255, 214, 19, 19),
                          // ),
                        ),

                        unselectedBackgroundColor: Color.fromARGB(
                          255,
                          245,
                          245,
                          220,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: TextStyle(color: Colors.black),

                        // radius: 36,
                        tabs: [
                          const Tab(text: 'Clothes'),
                          const Tab(text: 'Blankets'),
                          const Tab(text: 'Rug'),
                          const Tab(text: 'Shoes'),
                        ],

                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Column(
                          children: [
                            //clothes section
                            CustomContainer(
                              title: "undergarments",
                              discrib: "Washed and sanitized innerwear",
                              imagePath: "assets/images/under.png",
                              productImage: "assets/images/under.png",
                              productName: "undergarments",
                              productDiscrip: "Washed and sanitized innerwear",
                              showService: true,
                            ),
                            // SizedBox(height: 10),
                            CustomContainer(
                              title: "Thobe",
                              discrib:
                                  "Professionally cleaned and \npressed thobe",
                              imagePath: "assets/images/thobe.png",
                              productImage: "assets/images/thobe.png",
                              productName: "Thobe",
                              productDiscrip:
                                  "Professionally cleaned and \npressed thobe",
                              showService: true,
                            ),

                            CustomContainer(
                              title: "Shemagh",
                              discrib:
                                  " Cleaned and carefully pressed \n  traditional headscarf",
                              imagePath: "assets/images/shemagh.png",
                              productImage: "assets/images/shemagh.png",
                              productName: "Shemagh",
                              productDiscrip:
                                  " Cleaned and carefully pressed traditional headscarf",
                              showService: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ListView(
                    // blanket section
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Column(
                          children: [
                            // SizedBox(height: 10),
                            CustomContainer(
                              title: "King blanket",
                              discrib:
                                  "Laundry service for extra-large\nbedsheets fitting a king-sized bed",
                              imagePath: "assets/images/blanket.jpg",
                              productImage: "assets/images/blanket.jpg",
                              productName: "King blanket",
                              productDiscrip:
                                  "Laundry service for extra-large bedsheets fitting a king-sized bed",
                              showService: false,
                            ),
                            CustomContainer(
                              title: "Queen blanket",
                              discrib:
                                  " Laundry service for large bedsheets\n fitting a queen-sized bed",
                              imagePath: "assets/images/queenblanket.jpg",
                              productImage: "assets/images/queenblanket.jpg",
                              productName: "Queen blanket",
                              productDiscrip:
                                  " Laundry service for large bedsheets fitting a queen-sized bed",
                              showService: false,
                            ),
                            CustomContainer(
                              title: "Double blanket",
                              discrib:
                                  "Laundry service for bedsheets sized for\na medium single bed",
                              imagePath: "assets/images/double.png",
                              productImage: "assets/images/double.png",
                              productName: "Double blanket",
                              productDiscrip:
                                  "Laundry service for bedsheets sized for\na medium single bed",
                              showService: false,
                            ),
                            CustomContainer(
                              title: "Single blanket",
                              discrib:
                                  "Laundry service for bedsheets sized for\na small single bed",
                              imagePath: "assets/images/single.png",
                              productImage: "assets/images/single.png",
                              productName: "Single blanket",
                              productDiscrip:
                                  "Laundry service for bedsheets sized for \n small single bed",

                              showService: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Column(
                          children: [
                            //rug section
                            CustomContainer(
                              title: "Floor Rug",
                              discrib:
                                  "Professional cleaning for all types\nof floor rugs",
                              imagePath: "assets/images/floor_rug.jpeg",
                              productImage: "assets/images/floor_rug.jpeg",
                              productName: "Floor Rug",
                              productDiscrip:
                                  "Professional cleaning for all types of floor rugs",
                              showService: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Column(
                          children: [
                            //shoes section
                            CustomContainer(
                              title: "Shoes",
                              discrib:
                                  "Professional cleaning and care for all\ntypes of shoes",
                              imagePath: "assets/images/shoes.webp",
                              productImage: "assets/images/shoes.webp",
                              productName: "Shoes",
                              productDiscrip:
                                  "Professional cleaning and care for all types of shoes",
                              showService: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
