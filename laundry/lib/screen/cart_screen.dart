import 'package:flutter/material.dart';
import '/widget/cart_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.asset(item['image'], width: 50, height: 50),
            title: Text(item['name']),
            subtitle: Text(
              'Quantity: ${item['quantity']}' +
                  _buildServicesTextFormatted(item['services']),
            ),
          );
        },
      ),
    );
  }

  String _buildServicesTextFormatted(Map<String, dynamic>? services) {
    if (services == null) return '';

    List<String> activeServices = [];
    if (services['wash'] == true) activeServices.add('Wash');
    if (services['iron'] == true) activeServices.add('Iron');

    String timeText = '';
    if (services.containsKey('timeOption')) {
      if (services['timeOption'] == 0) {
        timeText = 'Closest Time';
      } else if (services['timeOption'] == 1) {
        timeText = 'Schedule Time';
      }
    }

    if (activeServices.isEmpty && timeText.isEmpty) return '';

    String servicesText = activeServices.join(', ');
    if (timeText.isNotEmpty) {
      servicesText += ' - $timeText';
    }

    return ' - Services: $servicesText';
  }
}
