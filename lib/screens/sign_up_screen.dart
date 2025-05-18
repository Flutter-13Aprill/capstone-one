import 'package:flutter/material.dart';

// -- Screen(For Navigate)
import 'package:shabah/screens/login_screen.dart';
import 'package:shabah/screens/otp_screen.dart';

// -- Controller 
import 'package:shabah/main.dart';
import 'package:shabah/controllers/localization_controller.dart';

// -- Extension
import 'package:shabah/extensions/screen_size.dart';

// -- External Package 
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

// -- App Theme
import 'package:shabah/style/app_colors.dart';
import 'package:shabah/widgets/authentication_screen/signup_form.dart';
import 'package:shabah/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  // Keys
  late final GlobalKey<FormState> _formGlobalKey;
  
  // Controllers
  late final TextEditingController _firstNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmationController;

  // Flags
  bool isKeepRememberMe = false;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();
    _formGlobalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
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
                    child: SvgPicture.asset('assets/login_screen/login_screen_svgs/Group.svg'),
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
                          child: Text(context.tr('sign_up_text'),style: Theme.of(context,).textTheme.titleLarge!.copyWith(fontSize: 28),
                          ),
                        ),
            
                        SizedBox(height: context.getHeight(multiplied: 0.04)),
            
                        SignupForm(formGlobalKey: _formGlobalKey, firstNameController: _firstNameController, phoneController: _phoneController, passwordController: _passwordController, passwordConfirmationController: _passwordConfirmationController),

                        SizedBox(height:  context.getHeight(multiplied: 0.01)),

                        Align(
                          alignment: LocalizationController.setAlignment(context: context),
                          child: Text(context.tr('agreement_to_sign_up_with_us'), style: Theme.of(context).textTheme.labelSmall,)
                        ),
                        
                        SizedBox(height:  context.getHeight(multiplied: 0.058)),

                        CustomButton(
                          labelText: context.tr('sign_up_text'),
                          onPressed:() {
                            if(_formGlobalKey.currentState!.validate()){
                              profile.userName = _firstNameController.text;
                              profile.phoneNumber = _phoneController.text;
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                            }
                          },
                        ),
            
                        SizedBox(height: context.getHeight(multiplied: 0.02),),
            
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                          child: Text(context.tr('i_have_an_account'), style: Theme.of(context).textTheme.labelSmall,),
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