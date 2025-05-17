import 'package:capstone/extensions/size.dart';
import 'package:capstone/widgets/controllers/login_controller.dart';
import 'package:capstone/widgets/text_fields/login.dart';
import 'package:capstone/widgets/text_fields/signup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//login screen is here with validators

LoginController loginController = LoginController();
int currentTab = 0;
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(appBar: AppBar(actions: [
        IconButton(onPressed: (){
            //if pressed change language
          if(context.locale.languageCode == "ar" ){
          context.setLocale(Locale('en', 'US'));

          }
          else{
            context.setLocale(Locale('ar', 'AR'));
     
            

          }
        }, icon: Icon(Icons.language,color: Colors.white,))
      ],),
        body: Center(
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // open and close eye on show password
              Container(
                height: context.getHieght() * 0.2,
                child:
                    loginController.isVisible
                        ? Image.asset('assets/images/login_eye.png')
                        : Image.asset('assets/images/sleep_eye.png'),
              ),
              Container(
                width: context.getWidth() * 0.85,
                height: context.getHieght() * 0.57,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black12),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    //show 2 taps for login and signout
                    Container(
                      height: 50,
                      child: TabBar(onTap: (value) {
                        currentTab = value;
                        setState(() {
                          
                        });
                      },
                        dividerColor: const Color.fromRGBO(158, 158, 158, 1),
                        tabs: [Text('login').tr(), Text('signup').tr()],
                      ),
                    ),
                    //login
                    Container(
                      height:context.getHieght() * 0.41,
                      child: TabBarView(
                        children: [
                          Login(
                            isVisable: loginController.isVisible,
                            emailController: loginController.emailController,
                            passwordController:
                                loginController.passwordController,
                            onPressed: () {
                              loginController.isViewed(
                                onDone: () {
                                  setState(() {});
                                },
                              );
                            },
                          ),
                          //signup
                          Signup(
                            isVisable: loginController.isVisible,
                            emailController:
                                loginController.registerEmailController,
                            passwordController:
                                loginController.registerPasswordController,
                            confirmPasswordController:
                                loginController.confirmPasswordController,
                            onPressed: () {
                              loginController.isViewed(
                                onDone: () {
                                  setState(() {});
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Text('or', style: TextStyle(fontSize: 18)).tr(),
                    SizedBox(height: 25,),
                    Row(spacing: 16,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.xTwitter,size: 35,color: Colors.white,),
                        Icon(FontAwesomeIcons.instagram,size: 35,color: Colors.white,),
                        Icon(FontAwesomeIcons.google,size: 35,color: Colors.white,),
                      ],
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
