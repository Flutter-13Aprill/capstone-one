import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laundry/controller/validator.dart';
import 'package:laundry/screen/bottom_nav_bar%20copy.dart';
import 'package:laundry/screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String name = '--';
  final fieldController = TextEditingController();

  final controller = Validator();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 246, 250),
      appBar: AppBar(
        // toolbarHeight: 30, //to resizr the app bar
        // backgroundColor: Color.fromARGB(255, 245, 246, 250),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/laundry_store.png",
                    height: 200,
                    width: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 2,
                        color: Color.fromARGB(255, 10, 104, 94),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: 380,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 172, 170, 170),
                              ),
                            ),
                          ),
                          TextFormField(
                            enabled: true,
                            controller: controller.emailControlle,
                            validator: Validator.validateEmail,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Username",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 172, 170, 170),
                              ),
                            ),
                          ),

                          TextFormField(
                            enabled: true,
                            controller: controller.userNameCotroller,
                            validator: Validator.validateUsername,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 172, 170, 170),
                              ),
                            ),
                          ),

                          TextFormField(
                            enabled: true,
                            controller: controller.userNameCotroller,
                            validator: Validator.validateUsername,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 172, 170, 170),
                              ),
                            ),
                          ),
                          TextFormField(
                            enabled: true,
                            controller: controller.passwordControlle,
                            validator: Validator.validatePassword,
                          ),
                          SizedBox(height: 16),

                          SizedBox(height: 16),

                          Row(
                            children: [
                              SizedBox(
                                height: 56,
                                width: 250,

                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_keyForm.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BottomNavBar(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text("Signup"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 56,
                            width: 311,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color.fromARGB(
                                  0,
                                  255,
                                  255,
                                  255,
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),

                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },

                              child: Padding(
                                //to adjust the text spaces
                                padding: const EdgeInsets.all(8),
                                child: Align(
                                  alignment:
                                      Alignment.center, //to adjust text place
                                  child: RichText(
                                    //to add two texts, one of them is clickable
                                    text: TextSpan(
                                      text: "Do you have an account?",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 10, 104, 94),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "   Log in",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                              255,
                                              86,
                                              142,
                                              130,
                                            ),
                                          ),

                                          recognizer:
                                              TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              LoginScreen(),
                                                    ),
                                                  );
                                                },
                                          //clickable text
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
