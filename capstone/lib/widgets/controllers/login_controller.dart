// import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class LoginController {
//check if password is visable or not
bool isVisible = false;

//controllers for login and signup

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController registerEmailController = TextEditingController();
TextEditingController registerPasswordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

//call it to change password visibilty
isViewed({required Function() onDone}){

isVisible = !isVisible;
onDone();

}

}