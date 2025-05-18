import 'package:coffee/screens/home_screen.dart';
import 'package:coffee/screens/login_screen.dart';
import 'package:coffee/style/app_colors.dart';
import 'package:coffee/widget/botton_design.dart';
import 'package:coffee/widget/custom_google.dart';
import 'package:coffee/widget/custom_text_field.dart';
import 'package:coffee/widget/translation_botton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  static final TextEditingController usernameController =TextEditingController();
  static final TextEditingController passwordController =TextEditingController();
  static final TextEditingController emailController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgImg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: Container(color: const Color.fromARGB(142, 0, 0, 0)),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [TranslationBotton()], // language botton
                    ),
                  ),
                  SizedBox(height: 120,),
// --------------------------------------- form validation --------------------------------------------------

                  Form( // user name (desin is external widget)
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'Username'.tr(), 
                          height: 55,
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'field required'.tr();
                            } else if (value.length <= 4) {
                              return 'input too short'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16,),
                        CustomTextField( // email text field and validation
                          label: 'E-mail'.tr(), 
                          height: 55,
                          controller: emailController,
                          validator: (value) {
                            if (value==null || value.isEmpty){
                              return 'field required'.tr();
                            } else if ( !value.contains(
                              RegExp(
                                // ignore: valid_regexps
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\. [a-zA-Z12,4}$',
                                )
                            ) ) {
                              return 'not correct';
                            }
                          },
                        ),
                        SizedBox(height: 16,),
                        CustomTextField( // password (desin is external widget)
                          label: 'Password'.tr(), // 
                          height: 55,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'field required'.tr();
                            } else if (value.length <= 7) {
                              return 'input too short'.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),

                        // botton-----------------------------------
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          },
                          child: BottonDesign(lable: 'sign up'.tr(), width: 0.8),
                        ),
                      ],
                    ),
                  ),

// -------------------------------------- form validation ---------------------------------------------------
                  SizedBox(height: 8,),
                  // CustomBotton(lable: 'sign up'.tr(), screen: HomeScreen(), width: 0.8,),
                  SizedBox(height: 80,),
                  CustomGoogle(img: 'assets/images/google.png', lable: 'Continue with Google'.tr()),

                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  }, child: Text('Already have account? Login'.tr(), style: TextStyle(color: AppColors.white, fontSize: 16),))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}