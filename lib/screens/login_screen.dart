import 'package:flutter/material.dart';

// -- Screens
import 'package:shabah/screens/otp_screen.dart';
import 'package:shabah/screens/sign_up_screen.dart';
import 'package:shabah/widgets/authentication_screen/login_form.dart';
import 'package:shabah/widgets/authentication_screen/remember_me_and_forgot_password.dart';
import 'package:shabah/widgets/custom_button.dart';

// -- Controllers
import 'package:shabah/controllers/localization_controller.dart';

// -- Extension 
import 'package:shabah/extensions/screen_size.dart';

// -- External Package 
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

class LoginScreen extends StatefulWidget {

  /// [LoginScreen] allows users to enter their phone number and password to log in.
  ///
  /// Includes input fields, validation, a "remember me" option, and navigation to the OTP screen upon successful login. 
  /// 
  /// Also provides a link to the sign-up screen.
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  // Keys
  late final GlobalKey<FormState> _formGlobalKey;

  // Controllers
  late final TextEditingController _phoneTextFieldController;
  late final TextEditingController _passwordTextFieldController;

  // Flags
  bool isKeepRememberMe = false;

  @override
  void initState() {
    _formGlobalKey = GlobalKey<FormState>();
    _phoneTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordTextFieldController.dispose();
    _phoneTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(

        bottom: false,
        child: GestureDetector(

          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            
            child: Stack(
              children: [

                Container(
                  height: context.getHeight(),
                  width: context.getWidth(),
                  margin: EdgeInsets.only(top: 32),
                  color: AppColors.secondaryColor,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset('assets/login_screen/login_screen_svgs/Group.svg',),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
                    width: context.getWidth(),
                    height: context.getHeight(multiplied: 0.8),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: Column(

                      children: [

                        SizedBox(height: context.getHeight(multiplied: 0.04)),

                        Align(
                          alignment: LocalizationController.setAlignment(context: context),
                          child: Text(context.tr('login_text'), style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),
                          ),
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.04)),

                        LoginForm(formGlobalKey: _formGlobalKey, phoneTextFieldController: _phoneTextFieldController, passwordTextFieldController: _passwordTextFieldController),

                        RememberMeAndForgotPassword(isKeepRememberMe: isKeepRememberMe),

                        SizedBox(height: context.getHeight(multiplied: 0.22),),

                        CustomButton(
                          labelText: context.tr('login_text'),
                          onPressed:() {
                            if(_formGlobalKey.currentState!.validate()){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                            }
                          },
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.02),),

                        InkWell(
                          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                          child: Text(context.tr('i_dont_have_account'), style: Theme.of(context).textTheme.labelSmall,),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}