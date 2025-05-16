import 'package:app/screen/bottom_navigation_bar_screen.dart';
import 'package:app/screen/widgets/button/button.dart';
import 'package:app/screen/widgets/text_form_field/text_form_field_register.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();//make a key 
  //Controllar for textfeilds 
  final emailControllar = TextEditingController();
  final passwordControllar = TextEditingController();
  final passwordRepatedControllar = TextEditingController();
  String? passwordMatchError; // State to hold the password mismatch error

  void _submitForm() {//function check validit of input in form feild 
    if (_formKey.currentState!.validate()) {
      //take password and  passwordRepate ti check if they eaqulls 
      String passwordRepate = passwordRepatedControllar.text;
      String password = passwordControllar.text;
      if (passwordRepate != password) {
        setState(() {
          passwordMatchError =
              "passwords_do_not_match".tr(); // Set the error message
        });
        return; // Stop the submission
      } else {
        setState(() {
          passwordMatchError =
              null; // Clear the error message if passwords match
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
        );
      }
    } else {
      print('Form is invalid');
      setState(() {
        passwordMatchError =
            null; // Clear any previous error if the form is invalid
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Focus.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "join".tr(),//dispaly text ad style it 
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              Form(//form 
                key: _formKey,//give it a key 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(//pading 
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${"email".tr()}\t\t\t\t",//dispaly email text and style it 
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    TextFormFieldRegister(//call TextFormFieldRegister and ive it lable & controller
                      controller: emailControllar,
                      lable: "email",
                    ),
                    SizedBox(height: 8),//space 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "password".tr(),//dispaly password text and style it
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    //call TextFormFieldRegister and ive it lable & controller&obscureText
                    TextFormFieldRegister(
                      obscureText: true,
                      controller: passwordControllar,
                      lable: "password",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(//dispaly repeat password text and style it
                        "repeat password".tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                                        //call TextFormFieldRegister and ive it lable & controller&obscureText
                    TextFormFieldRegister(
                      obscureText: true,
                      controller: passwordRepatedControllar,
                      lable: "repetepassword".tr(),
                    ),

                    Center(//call button 
                      child: Button(
                        title: "sign_up",
                        onPressed: () {
                          _submitForm();//go _submitForm
                          setState(() {});//pdate value
                        },
                      ),
                    ),
                    Padding(//pading 
                      padding: const EdgeInsets.only(left:95,top: 20),
                      child: Text(
                        //ifthere rror print it 
                        passwordMatchError ?? "",
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: StyleColor.primarRedGrayyeColor,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
