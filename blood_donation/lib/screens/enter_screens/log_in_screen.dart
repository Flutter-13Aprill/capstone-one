// import 'package:blood_donation/exstenshon/exstenshon.dart';
import 'package:blood_donation/screens/Donar/bottomnavigation_donar_screen.dart';
import 'package:blood_donation/screens/DonarRequester/bottomnavigation_donarRequest_screen.dart';
import 'package:blood_donation/theems/color.dart';
import 'package:blood_donation/widgets/enter_widget/background_theem.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key, required this.name});
  final String name;
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundTheem(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),

            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "username is requaired ";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "user_name".tr(),
                      labelText: "user_name".tr(),
                      labelStyle: TextStyle(color: myAppColor.redcolor),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password is requaired";
                      } else if (!value.contains(
                        RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        ),
                      )) {
                        return "email is not correct";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "password".tr(),
                      labelText: "password".tr(),
                      labelStyle: TextStyle(color: myAppColor.redcolor),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (widget.name.trim() == "Donar") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => BottomnavigationDonarScreen(),
                            ),
                          );
                        } else if (widget.name.trim() == "Not Donar") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      BottomnavigationDonarrequestScreen(),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 45),
                      backgroundColor: myAppColor.graycolor,
                    ),
                    child: Text(
                      "log_in".tr(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                "create_acount".tr(),
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "forget_password".tr(),
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
