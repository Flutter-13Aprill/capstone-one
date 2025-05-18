import 'package:flutter/material.dart';

class HomeController {
  final PageController pageController = PageController();
  int currentIndex = 0;
  int clickedIndex = 0;

  final List<Map<String, dynamic>> cardData = [
    {"cardNumber": "1234 5678 9123 1234", "expirationDate": "03/29"},
    {"cardNumber": "9876 5432 1098 7654", "expirationDate": "11/26"},
    {"cardNumber": "4567 8901 2345 6789", "expirationDate": "07/25"},
    {"cardNumber": "4567 8901 2345 6789", "expirationDate": "07/25"},
    {"cardNumber": "4567 8901 2345 6789", "expirationDate": "07/25"},
  ];

  final List<Map<String, dynamic>> transactionTabs = [
    {"title": "all_transactions", "icon": Icons.list_alt},
    {"title": "incoming_transactions", "icon": Icons.arrow_downward},
    {"title": "outgoing_transactions", "icon": Icons.arrow_upward},
  ];

  final List<Map<String, dynamic>> allTransactions = [
    {
      "name": "Remas Alnugaithan",
      "time": "10:22 AM",
      "amount": "+ 7200",
      "isIncome": true,
    },
    {
      "name": "Ahmed Al-Saud",
      "time": "08:30 AM",
      "amount": "+ 1500",
      "isIncome": true,
    },
    {
      "name": "Raghad Alharbi",
      "time": "05:45 PM",
      "amount": "- 700",
      "isIncome": false,
    },
    {
      "name": "Mohammed Saleh",
      "time": "02:15 PM",
      "amount": "+ 3200",
      "isIncome": true,
    },
    {
      "name": "Sara Al-Mutairi",
      "time": "09:00 AM",
      "amount": "- 450",
      "isIncome": false,
    },
    {
      "name": "Omar Al-Qahtani",
      "time": "07:30 PM",
      "amount": "+ 800",
      "isIncome": true,
    },
    {
      "name": "Remas Alnugaithan",
      "time": "10:22 AM",
      "amount": "+ 7200",
      "isIncome": true,
    },
    {
      "name": "Ahmed Al-Saud",
      "time": "08:30 AM",
      "amount": "+ 1500",
      "isIncome": true,
    },
    {
      "name": "Lina Alsudairy",
      "time": "05:45 PM",
      "amount": "- 700",
      "isIncome": false,
    },

    {
      "name": "Sadeem Alnugaithan",
      "time": "11:15 AM",
      "amount": "- 6000",
      "isIncome": false,
    },
    {
      "name": "Shouq Albuhairi",
      "time": "01:20 PM",
      "amount": "- 7500",
      "isIncome": false,
    },
    {
      "name": "Hajar Albuhairi",
      "time": "03:05 PM",
      "amount": "- 4500",
      "isIncome": false,
    },
    {
      "name": "Mohammed Saleh",
      "time": "02:15 PM",
      "amount": "+ 3200",
      "isIncome": true,
    },
    {
      "name": "Sara Al-Mutairi",
      "time": "09:00 AM",
      "amount": "- 450",
      "isIncome": false,
    },
    {
      "name": "Omar Al-Qahtani",
      "time": "07:30 PM",
      "amount": "+ 800",
      "isIncome": true,
    },
  ];

  List<Map<String, dynamic>> get transactionsToShow {
    if (clickedIndex == 1) {
      return allTransactions.where((t) => t["isIncome"] == true).toList();
    } else if (clickedIndex == 2) {
      return allTransactions.where((t) => t["isIncome"] == false).toList();
    } else {
      return allTransactions;
    }
  }

  bool isLoading = true;
}
