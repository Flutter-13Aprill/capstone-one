import 'dart:convert';
import 'package:blood_donation/theems/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestDonor extends StatefulWidget {
  const RequestDonor({super.key});

  @override
  State<RequestDonor> createState() => _RequestDonorState();
}

class _RequestDonorState extends State<RequestDonor> {
  List<Map<String, dynamic>> donationRequests = [];

  @override
  void initState() {
    super.initState();
    loadRequests();
  }

  Future<void> loadRequests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> requests = prefs.getStringList("donation_requests") ?? [];

    setState(() {
      donationRequests =
          requests
              .map((e) => jsonDecode(e))
              .toList()
              .cast<Map<String, dynamic>>();
    });
  }

  Future<void> saveRequests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encoded = donationRequests.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList("donation_requests", encoded);
  }


  Future<void> deleteRequest(int index) async {
    donationRequests.removeAt(index);
    await saveRequests();
    loadRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Donor Requests"),
      ),
      body:
          donationRequests.isEmpty
              ? Center(child: Text("No requests yet"))
              : ListView.builder(
                itemCount: donationRequests.length,
                itemBuilder: (context, index) {
                  final item = donationRequests[index];
                  final int needed =
                      int.tryParse(item['donationNeeded'].toString()) ?? 0;
                  final int donated = item['donorsCount'] ?? 0;
                  final int remaining = (needed - donated).clamp(0, needed);

                  return Card(
                    margin: EdgeInsets.all(8),
                    color: myAppColor.graycolor,
                    elevation: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("File #: ${item['file'] ?? ''}"),
                          Text("Blood Type: ${item['blood'] ?? ''}"),
                          Text("State: ${item['state'] ?? ''}"),
                          Text("Hospital: ${item['hospital'] ?? ''}"),
                          Text("City:${item["city"] ?? ''}"),

                          Text("Bags Needed: $needed"),
                          Text("Donors so far: $donated"),
                          Text("Remaining: $remaining"),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: myAppColor.redcolor,
                              ),
                              onPressed: () => deleteRequest(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
