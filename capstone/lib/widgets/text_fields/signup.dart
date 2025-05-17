import 'package:capstone/extensions/size.dart';
import 'package:capstone/widgets/bottom_nav_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//here is to make text fields for signup

class Signup extends StatelessWidget {
  const Signup({
    super.key,
    this.isVisable = false,
    this.onPressed,
    required this.passwordController,
    required this.emailController,
    required this.confirmPasswordController,
  });

  final bool isVisable;
  final TextEditingController passwordController;
  final Function()? onPressed;
  final TextEditingController emailController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    var tempPassowrd = '';
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 25),
            //email with validation
            Container(
              width: context.getWidth() * 0.75,
              child: TextFormField(style: TextStyle(color: Colors.white),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    //not empty validator
                    return 'validEmailNotEmpty'.tr();
                    //validate is email
                  } else if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                  ).hasMatch(value)) {
                    return 'validEmail'.tr();
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'email'.tr(),
                ),
              ),
            ),
            //password with validation
            Container(
              width: context.getWidth() * 0.75,
              child: TextFormField(style: TextStyle(color: Colors.white),
                validator: (value) {
                  //not empty
                  if (value == null || value.isEmpty) {
                    return 'validPasswordNotEmpty'.tr();
                    // at least have 1 number 1 CAP 1 small letter 1 special charcter the length is 8
                  } else if (!RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  ).hasMatch(value)) {
                    return 'regeisterPassword'.tr();
                  } else {
                    // assign temp value to current password to check it in confirm password
                    tempPassowrd = value;
                    return null;
                  }
                },
                controller: passwordController,
                obscureText: isVisable ? false : true,
                decoration: InputDecoration(errorMaxLines: 3,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'password'.tr(),

                  suffixIcon: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      isVisable ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
            //confirm password with validation 
            Container(
              width: context.getWidth() * 0.75,
              child: TextFormField(style: TextStyle(color: Colors.white),
                validator: (value) {
                  //confirm password is not empty
                  if (value == null || value.isEmpty) {
                    return 'validPasswordNotEmpty'.tr();
                    //confirm the password is the same as the previous textfield
                  } else if (tempPassowrd != value) {
                    return 'confirmRegisterPassword'.tr();
                  } else {
                    return null;
                  }
                },
                controller: confirmPasswordController,
                obscureText: isVisable ? false : true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'confirmPassword'.tr(),

                  suffixIcon: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      isVisable ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
            
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 172, 173, 173),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  //go to next page if there is no issues
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavHandler()),
                    );
                  }
                },
                child: Text('submitSignup',style: TextStyle(color: Colors.black)).tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
