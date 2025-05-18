import 'package:blood_donation/theems/color.dart';
import 'package:blood_donation/widgets/donar_widget/bild_city.dart';
import 'package:blood_donation/widgets/donar_widget/card_donor_widget.dart';
import 'package:blood_donation/widgets/donar_widget/detail_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DonorVolunteerScreen extends StatefulWidget {
  const DonorVolunteerScreen({super.key});

  @override
  State<DonorVolunteerScreen> createState() => _DonorVolunteerScreenState();
}

class _DonorVolunteerScreenState extends State<DonorVolunteerScreen> {
  List<Map<String, dynamic>> allRequests = [];
  List<Map<String, dynamic>> filteredRequests = [];
  String searchQuery = "";
  String selectedCity = "All".tr();

  @override
  void initState() {
    super.initState();
    loadRequests();
  }

  Future<void> loadRequests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stored = prefs.getStringList("donation_requests") ?? [];

    List<Map<String, dynamic>> loaded =
        stored.map((e) => jsonDecode(e)).cast<Map<String, dynamic>>().toList();

    setState(() {
      allRequests = loaded;
      applyFilters();
    });
  }

  Future<void> saveRequests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updated = allRequests.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList("donation_requests", updated);
  }

  void applyFilters() {
    setState(() {
      filteredRequests =
          allRequests.where((item) {
            final city = item['city']?.toString() ?? '';
            final file = item['file']?.toString() ?? '';

            final matchesCity =
                selectedCity == "All".tr() || city.startsWith(selectedCity!);

            final matchesSearch =
                searchQuery.isEmpty ||
                file.contains(searchQuery) ||
                city.toLowerCase().contains(searchQuery.toLowerCase());

            return matchesCity && matchesSearch;
          }).toList();
    });
  }

  Future<void> markInterested(int index) async {
    int current = int.tryParse(allRequests[index]['donationNeeded']) ?? 0;
    if (current > 0) {
      setState(() {
        allRequests[index]['donationNeeded'] = (current - 1).toString();
      });
      await saveRequests();
      // applyFilters();
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              backgroundColor: myAppColor.graycolor,
              title: Text("thanks".tr()),
              content: Text("interest_noted".tr()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("ok"),
                ),
              ],
            ),
      );
    }
  }

  void showDetails(Map<String, dynamic> item, int index) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder:
          (_) => RequestDetailSheet(
            item: item,
            onDonate: () => markInterested(index),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("blood_donation".tr()),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "search_file".tr(),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    searchQuery = value;
                    applyFilters();
                  },
                ),
              ),
              BildCity(
                selected: selectedCity,
                oncityselect: (city) {
                  setState(() {
                    selectedCity = city;
                    applyFilters();
                  });
                },
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
      body:
          filteredRequests.isEmpty
              ? Center(child: Text("no_request".tr()))
              : ListView.builder(
                itemCount: filteredRequests.length,
                itemBuilder: (context, index) {
                  final item = filteredRequests[index];
                  final realIndex = allRequests.indexOf(item);
                  return RequestCardWidget(
                    file: item['file'],
                    city: item["city"],
                    onTap: () => showDetails(item, realIndex),
                  );
                },
              ),
    );
  }
}
