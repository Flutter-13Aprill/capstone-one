import 'package:coffee/style/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DeliverScreen extends StatelessWidget {
  const DeliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Stack(
        children: [
          ElevatedButton(
  onPressed: () {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("10 minutes left".tr(), style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.delivery_dining_rounded,size: 60, color: AppColors.brown,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Johan Hawn'.tr(), style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Personal Courier'.tr(), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12))
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGray,width: 2),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(Icons.phone_in_talk_rounded),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  },
  child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
)
        ],
      ),
    );
  }
}