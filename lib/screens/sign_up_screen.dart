import 'package:flutter/material.dart';
import 'package:spotify_redesign/screens/home_screen.dart';
import 'package:spotify_redesign/screens/login.dart';
import 'package:spotify_redesign/widgets/entry_widgets/entry_text_button.dart';
import 'package:spotify_redesign/widgets/entry_widgets/sso_container.dart';

final _formKey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
        title: Image.asset(
          "assets/icons/Spotify_Logo_RGB_Green.png",
          scale: 1.5,
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 24),
          Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 36),

          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Should be atleast 3 charectars";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value ==
                          RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          )) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Inavlid Password";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: repeatPasswordController,
                    decoration: InputDecoration(
                      hintText: "Repeat Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 3 ||
                          repeatPasswordController.value !=
                              passwordController.value) {
                        return "Make sure the password is the same";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
            child: Container(
              width: 340,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(80),
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(color: Colors.white, height: 100),
              ),
              Container(
                width: 50,
                color: Colors.black,
                child: Center(
                  child: Text("Or", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container for "FaceBook"
              SSOContainer(imagePath: "assets/icons/facebook_icon.png"),

              // Container for Google
              SSOContainer(imagePath: "assets/icons/google_icon.png"),

              // Container for Apple
              SSOContainer(imagePath: "assets/icons/apple_icon.png"),
            ],
          ),

          SizedBox(height: 16),
          Center(
            child: EntryTextButton(
              whiteText: "Already have an Account",
              coloredText: "Login",
              destination: LoginScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
