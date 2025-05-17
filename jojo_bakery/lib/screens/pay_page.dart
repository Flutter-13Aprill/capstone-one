import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jojo_bakery/controller/local_controller.dart';
import 'package:jojo_bakery/screens/waiting_order.dart';
import 'package:jojo_bakery/theme/app_colors.dart';
import 'package:jojo_bakery/widgets/custom_button.dart';
import 'package:jojo_bakery/widgets/section_header.dart';

class PayPage extends StatefulWidget {
  final double total;

  const PayPage({super.key, required this.total});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final loclaiztionController = LocalizationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pay_page.app_bar.title'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SectionHeader(
            title: 'pay_page.section_header.title'.tr(),
            actionText: '${widget.total.toStringAsFixed(2)} SR',
          ),
          Container(
            height: 320,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 16),
            child: Image.asset(
              'assets/images/pay1.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          backgroundColor: AppColors.primary,
          text:
              '${'pay_page.button.pay_now'.tr()}${widget.total.toStringAsFixed(2)}',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderProcessingScreen()),
            );
          },
        ),
      ),
    );
  }
}
