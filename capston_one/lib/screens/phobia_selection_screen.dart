import 'package:flutter/material.dart';
//easy_localization library to support translation.
import 'package:easy_localization/easy_localization.dart';
import '../controller/phobia_selection_controller.dart';

class PhobiaSelection extends StatelessWidget {
  PhobiaSelection({super.key});

  final PhobiaSelectionController _controller = PhobiaSelectionController();
//A list of phobias (names and images), where each name is localized using .tr().
  final List<Map<String, dynamic>> phobias = [
    {"name": "Darkness".tr(), "image": "assets/pic/dark.jpg"},
    {"name": "Heights".tr(), "image": "assets/pic/heights.jpg"},
    {"name": "Public Speaking".tr(), "image": "assets/pic/public.jpg"},
    {"name": "Insects".tr(), "image": "assets/pic/spiders.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    // Fetch the username from the controller to display it in the app bar title.
    final String? userName = _controller.getUserName();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 206, 207, 196),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //A welcome text with the username (translated using the key trans2 with the username passed as a parameter).
            if (userName != null)
              Text(
                tr('trans2', args: [userName]),
                style: const TextStyle(fontSize: 14),
              ),
            //A button to toggle the app language between English and Arabic when pressed.
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                context.setLocale(
                  context.locale.languageCode == 'en'
                      ? const Locale('ar', 'AR')
                      : const Locale('en', 'US'),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 2,
              color: const Color.fromARGB(255, 145, 142, 146),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 8),
              child: Text(
                "phobia_selection".tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 117, 56, 121),
                ),
              ),
            ),

            // A ListView.builder: that builds cards for each phobia.
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(25),
                itemCount: phobias.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      phobias[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.navigateToExplanation(
                                            context, phobias[index]['name']);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 12),
                                        textStyle: const TextStyle(fontSize: 12),
                                      ),
                                      child: Text('get_started'.tr()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                phobias[index]['image'],
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
