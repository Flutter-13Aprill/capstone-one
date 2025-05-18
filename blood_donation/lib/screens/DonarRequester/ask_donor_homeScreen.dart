import 'dart:convert';
import 'package:blood_donation/theems/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskDonorHomeScreen extends StatefulWidget {
  const AskDonorHomeScreen({super.key});

  @override
  State<AskDonorHomeScreen> createState() => _AskDonorHomeScreenState();
}

class _AskDonorHomeScreenState extends State<AskDonorHomeScreen> {
  final fileController = TextEditingController();
  final hospitalController = TextEditingController();
  final neededDonateController = TextEditingController();
  final cityController = TextEditingController();
  String? selectedBloodType;
  String? selectedStateType;

  bool showCheckbox = false;
  bool checkboxValue = false;

  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  final List<String> states = ['Critical'.tr(), 'Moderate'.tr(), 'Stable'.tr()];
  final List<String> cities = [
    "riyadh".tr(),
    "Qassim".tr(),
    "jeddah".tr(),
    "khobar".tr(),
  ];
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Add_Donor_Request".tr()),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              SizedBox(height: 12),
              TextField(
                controller: fileController,
                decoration: InputDecoration(labelText: "File_Number".tr()),
              ),
              SizedBox(height: 12),

              TextField(
                controller: hospitalController,
                decoration: InputDecoration(labelText: "Hospital".tr()),
              ),
              SizedBox(height: 12),

              DropdownButtonFormField<String>(
                dropdownColor: myAppColor.graycolor,
                decoration: InputDecoration(labelText: "city".tr()),
                value: selectedCity,
                items:
                    cities.map((city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
              ),
              SizedBox(height: 12),
              TextField(
                controller: neededDonateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Bags_Needed".tr()),
              ),
              SizedBox(height: 20),

              Text(
                "Select_Case_State:".tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    states.map((states) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: states,
                            groupValue: selectedStateType,
                            onChanged: (value) {
                              setState(() {
                                selectedStateType = value!;
                              });
                            },
                          ),
                          Text(states),
                        ],
                      );
                    }).toList(),
              ),

              SizedBox(height: 12),

              Text(
                "blood_type".tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children:
                    bloodTypes.map((type) {
                      final isSelected = selectedBloodType == type;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBloodType = type;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? myAppColor.redcolor
                                    : myAppColor.graycolor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? myAppColor.redcolor
                                      : myAppColor.graycolor,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            type,
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  isSelected
                                      ? myAppColor.whitecolor
                                      : myAppColor.redcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),

              SizedBox(height: 12),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 50),
                  backgroundColor: myAppColor.graycolor,
                ),
                onPressed: saveRequest,
                child: Text(
                  "Add_Request".tr(),
                  style: TextStyle(fontSize: 16, color: myAppColor.redcolor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveRequest() async {
    final file = fileController.text.trim();
    final hospital = hospitalController.text.trim();
    final needed = neededDonateController.text.trim();
    final blood = selectedBloodType ?? "";
    final state = selectedStateType ?? "";
    final city = selectedCity ?? "";

    if (file.isEmpty ||
        hospital.isEmpty ||
        needed.isEmpty ||
        blood.isEmpty ||
        state.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("pleace_entery_all_the_fields".tr())),
      );
      return;
    }

    Map<String, dynamic> request = {
      "file": file,
      "hospital": hospital,
      "donationNeeded": needed,
      "blood": blood,
      "state": state,
      "city": city,
      "donorsCount": 0,///////
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> requests = prefs.getStringList("donation_requests") ?? [];
    requests.add(jsonEncode(request));
    await prefs.setStringList("donation_requests", requests);

    // clear everything
    fileController.clear();
    hospitalController.clear();
    neededDonateController.clear();
    cityController.clear();
    selectedBloodType = null;
    selectedStateType = null;
    
    setState(() {});
  }
}
