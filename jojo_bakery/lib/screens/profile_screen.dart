import 'package:flutter/material.dart';
import 'package:jojo_bakery/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/user2.png'),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage('assets/icons/profile.png'),
              ),
              SizedBox(width: 20),
              Text('حسابي'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage('assets/icons/password.png'),
              ),
              SizedBox(width: 20),
              Text('تغيير كلمة المرور'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage('assets/icons/time.png'),
              ),
              SizedBox(width: 20),
              Text('الطلبات'),
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage('assets/icons/alrm.png'),
              ),
              SizedBox(width: 20),
              Text('التنبيهات'),
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage('assets/icons/help.png'),
              ),
              SizedBox(width: 20),
              Text('المساعده والدعم'),
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              SizedBox(width: 20),
              Image.asset('assets/icons/out.png'),
              SizedBox(width: 20),
              Text('تسجيل خروج'),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
