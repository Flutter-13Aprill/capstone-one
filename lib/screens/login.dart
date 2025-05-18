import 'package:flutter/material.dart';
import 'package:spotify_redesign/screens/home_screen.dart';
import 'package:spotify_redesign/screens/sign_up_screen.dart';
import 'package:spotify_redesign/widgets/entry_widgets/entry_text_button.dart';
import 'package:spotify_redesign/widgets/entry_widgets/sso_container.dart';


final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            "Log In",
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
                SizedBox(height: 24),

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
              ],
            ),
          ),

          SizedBox(height: 8),

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
                  "Login",
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
              whiteText: "Don't have an account",
              coloredText: "Sign Up",
              destination: SignUpScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
