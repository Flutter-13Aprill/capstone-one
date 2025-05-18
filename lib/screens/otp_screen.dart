import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:shabah/extensions/screen_size.dart';
import 'package:shabah/main.dart';
import 'package:shabah/screens/bottom_nav_screen.dart';
import 'package:shabah/style/app_colors.dart';
import 'package:shabah/widgets/otp_screen/otp_container_field.dart';
import 'dart:ui';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Keys
  late final GlobalKey<FormState> _formKey;

  // Controllers
  late final TextEditingController _firstController;
  late final TextEditingController _secondController;
  late final TextEditingController _thirdController;
  late final TextEditingController _fourthController;

  //  Focus Nodes
  late final FocusNode _firstFocusNode;
  late final FocusNode _secondFocusNode;
  late final FocusNode _thirdFocusNode;
  late final FocusNode _fourthFocusNode;

  final String fakeValue = '2001';
  String enteredVale = '';

  bool isThereAnError = false;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
    _fourthController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {

    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: context.getHeight(multiplied: 0.05)),

              Align(
                alignment: context.locale.languageCode == 'en' ? Alignment.centerLeft : Alignment.centerRight,
                child: Text(context.tr('otp_welcome_text',args: [profile.userName]),style: Theme.of(context).textTheme.displayMedium,),
              ),

              Align(
                alignment: context.locale.languageCode == 'en' ? Alignment.centerLeft : Alignment.centerRight,
                child: Text(context.tr('enter_otp_number'),style: Theme.of(context).textTheme.titleLarge,),
              ),

              SizedBox(height: context.getHeight(multiplied: 0.15)),

              Directionality(
                textDirection: TextDirection.ltr,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtpContainerField(
                        focus: _firstFocusNode,
                        controller: _firstController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            enteredVale += value;
                            FocusScope.of(context).requestFocus(_secondFocusNode);
                          }
                        },
                      ),
                
                      OtpContainerField(
                        focus: _secondFocusNode,
                        controller: _secondController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            enteredVale += value;
                            FocusScope.of(context).requestFocus(_thirdFocusNode);
                          }
                        },
                      ),
                
                      OtpContainerField(
                        focus: _thirdFocusNode,
                        controller: _thirdController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            enteredVale += value;
                            FocusScope.of(context).requestFocus(_fourthFocusNode);
                          }
                        },
                      ),
                
                      OtpContainerField(
                        focus: _fourthFocusNode,
                        controller: _fourthController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            enteredVale += value;
                            _fourthFocusNode.unfocus();
                          }
                        },
                        onValidator: (value) {
                          if (fakeValue != enteredVale) {
                            setState(() {
                              _firstController.clear();
                              _secondController.clear();
                              _thirdController.clear();
                              _fourthController.clear();
                              enteredVale = '';
                              isThereAnError = true;
                            });
                            return null;
                          } else {
                            setState(() {
                              isThereAnError = false;
                            });
                
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: context.getHeight(multiplied: 0.016)),

              if (isThereAnError)
                Text(context.tr('error_message_with_wrong_otp'), style: Theme.of(context,).textTheme.displayMedium!.copyWith(color: Colors.red),),

              Align(
                alignment: context.locale.languageCode == 'en' ? Alignment.centerLeft : Alignment.centerRight,
                child: Text(context.tr('resend_otp'),style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.labelText,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
