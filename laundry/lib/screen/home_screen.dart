import 'package:flutter/material.dart';
import 'package:laundry/screen/laundry_screen.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String searchText = "";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),

        shadowColor: Colors.black,
        elevation: 5.0,

        // backgroundColor: Color.fromARGB(255, 245, 245, 220),
        toolbarHeight: 100,

        automaticallyImplyLeading: false,

        title: Text(
          "home.greeting".tr(),
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(166, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        //  Text(
        //   "Hello,\n Shatha",

        // ),
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedSearchBar(
              label: "home.search_label".tr(),

              labelStyle: TextStyle(color: Colors.grey),
              onChanged: (value) {
                debugPrint("value on Change");
                setState(() {
                  searchText = value;
                });
              },
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "home.highest_reviews".tr(),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          //shimmer effect
          Container(
            height: 230,
            width: double.infinity,
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isLoading
                        ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            width: 180,
                            height: 150,
                            color: Colors.grey,
                          ),
                        )
                        : InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => LaundryScreen(
                                      imagePath: "assets/images/narjis.jpeg",
                                      laundryName: "An Narjis Laundry",
                                      laundryDiscrib:
                                          "          Reliable washing and ironing services\n\n",
                                      logoPath: "assets/images/narjis_logo.png",
                                      time: "Open now",
                                      distance: "7km",
                                    ),
                              ),
                            );
                          },
                          child: reviewContainer(
                            "assets/images/narjis.jpeg",
                            "5.0",
                            "assets/images/narjis_logo.png",
                          ),
                        ),
                    Directionality(
                      textDirection: ui.TextDirection.rtl,

                      child: Text(
                        "home.laundries.narjis.name".tr(),

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoading
                        ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            width: 180,
                            height: 150,
                            color: Colors.grey,
                          ),
                        )
                        : InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => LaundryScreen(
                                      imagePath: "assets/images/laundry1.jpg",
                                      laundryName: "Aljabr Laundry",
                                      laundryDiscrib:
                                          "          Reliable washing and ironing services\n\n",
                                      logoPath: "assets/images/alawal_logo.png",
                                      time: "Open now",
                                      distance: "10km",
                                    ),
                              ),
                            );
                          },
                          child: reviewContainer(
                            "assets/images/laundry1.jpg",
                            "5.0",
                            "assets/images/aljabr_logo.png",
                          ),
                        ),
                    Text(
                      "home.laundries.aljabr.name".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => LaundryScreen(
                                  imagePath: "assets/images/laundry4.jpg",
                                  laundryName: "Falak Laundry",
                                  laundryDiscrib:
                                      "          Reliable washing and ironing services\n\n",
                                  logoPath: "assets/images/falak_logo.png",
                                  time: "Open now",
                                  distance: "3km",
                                ),
                          ),
                        );
                      },
                      child: reviewContainer(
                        "assets/images/laundry4.jpg",
                        "5.0",
                        "assets/images/falak_logo.png",
                      ),
                    ),
                    Text(
                      "home.laundries.falak.name".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),

                SizedBox(width: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "home.all_laundries".tr(),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isLoading
                    ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade200,
                        child: Container(
                          width: 380,
                          height: 120,
                          color: Colors.grey,
                        ),
                      ),
                    )
                    : InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => LaundryScreen(
                                  imagePath: "assets/images/laundry5.jpg",
                                  laundryName: "AlAwal Laundry",
                                  laundryDiscrib: "laundry dis",
                                  logoPath: "assets/images/alawal_logo.png",
                                  time: "Open now",
                                  distance: "10km",
                                ),
                          ),
                        );
                      },

                      child: allLaundryContain(
                        "assets/images/laundry2.jpg",
                        "5.0",
                        "assets/images/alawal_logo.png",
                      ),
                    ),
                SizedBox(height: 8),
                Text(
                  "home.laundries.alawal.name".tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),
                isLoading
                    ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade200,
                        child: Container(
                          width: 380,
                          height: 120,
                          color: Colors.grey,
                        ),
                      ),
                    )
                    : InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => LaundryScreen(
                                  imagePath: "assets/images/laundry1.jpg",
                                  laundryName: "Aljabr Laundry",
                                  laundryDiscrib: "laundry dis",
                                  logoPath: "assets/images/aljabr_logo.png",
                                  time: "Open now",
                                  distance: "10km",
                                ),
                          ),
                        );
                      },
                      child: allLaundryContain(
                        "assets/images/laundry1.jpg",
                        "5.0",
                        "assets/images/aljabr_logo.png",
                      ),
                    ),
                SizedBox(height: 8),
                Text(
                  "home.laundries.aljabr.name".tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => LaundryScreen(
                              imagePath: "assets/images/laundry4.jpg",
                              laundryName: "Falak Laundry",
                              laundryDiscrib: "laundry dis",
                              logoPath: "assets/images/falak_logo.png",
                              time: "Open now",
                              distance: "10km",
                            ),
                      ),
                    );
                  },

                  child: allLaundryContain(
                    "assets/images/laundry4.jpg",
                    "5.0",
                    "assets/images/falak_logo.png",
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "home.laundries.falak.name".tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),

                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => LaundryScreen(
                              imagePath: "assets/images/narjis.jpeg",
                              laundryName: "An Narjis Laundry",
                              laundryDiscrib: "laundry dis",
                              logoPath: "assets/images/narjis_logo.png",
                              time: "Open now",
                              distance: "10km",
                            ),
                      ),
                    );
                  },
                  child: allLaundryContain(
                    "assets/images/narjis.jpeg",
                    "5.0",
                    "assets/images/narjis_logo.png",
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "home.laundries.narjis.name".tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget reviewContainer(String backImage, String text, String logo) {
  return Stack(
    children: [
      Container(
        width: 180,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent, width: 2),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(backImage),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10),
        child: Container(
          height: 40,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.transparent, width: 2),
            image: DecorationImage(image: AssetImage(logo)),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 100, left: 124.0),
        child: Stack(
          children: [
            Container(
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),

                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: const Color.fromARGB(255, 237, 221, 76),
                  ),

                  Text(text),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget allLaundryContain(String backImage, String text, String logo) {
  return Stack(
    children: [
      Container(
        height: 120,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blueGrey,
          border: Border.all(color: Colors.transparent, width: 2),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(backImage),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10),
        child: Container(
          height: 40,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.transparent, width: 2),
            image: DecorationImage(image: AssetImage(logo)),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 80, left: 325.0),
        child: Stack(
          children: [
            Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),

                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: const Color.fromARGB(255, 237, 221, 76),
                  ),

                  Text(text),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
