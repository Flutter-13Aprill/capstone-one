import 'package:capstone/extensions/size.dart';
import 'package:capstone/widgets/bottom_nav_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//here is where login is defiend

class Login extends StatelessWidget {
  const Login({
    super.key,
    this.isVisable = false,
    this.onPressed,
    required this.passwordController,
    required this.emailController,
  });

  final bool isVisable;
  final TextEditingController passwordController;
  final Function()? onPressed;
  final TextEditingController emailController;

  @override
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 25),
            //email textfield with validator
            Container(
              width: context.getWidth() * 0.75,
              child: TextFormField(style: TextStyle(color: Colors.white),
                controller: emailController,
                validator: (value) {
                  //field is not empty condition
                  if (value == null || value.isEmpty) {
                    return 'validEmailNotEmpty'.tr();
                    //input is an eamil
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
            //password textfield with validator
            Container(
              width: context.getWidth() * 0.75,
              child: TextFormField(style: TextStyle(color: Colors.white),
                validator: (value) {
                  //check if password not empty
                  if (value == null || value.isEmpty) {
                    return 'validPasswordNotEmpty'.tr();
                    //check if length is 8 and contains letters and CAPS and special charcter
                  } else if (!RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  ).hasMatch(value)) {
                    return 'validPassword'.tr();
                  } else {
                    return null;
                  }
                },
                controller: passwordController,
                obscureText: isVisable ? false : true,
                decoration: InputDecoration(
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
            Container(
              width: context.getWidth() * 0.7,
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.start,
                'forgotPassword',
                style: TextStyle(fontSize: 18,color: Colors.grey),
              ).tr(),
            ),
            SizedBox(height: 25,),
            Container(width: 200,height: 40,decoration: BoxDecoration(color: const Color.fromARGB(255, 172, 173, 173),borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  //go next page if there is no issue
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavHandler()),
                    );
                  }
                },
                child: Text('submitLogin',style: TextStyle(color: Colors.black),).tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
