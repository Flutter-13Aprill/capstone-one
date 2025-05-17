import 'package:flutter/material.dart';
import 'package:jojo_bakery/screens/main_layout.dart';
import 'package:jojo_bakery/theme/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _keyForm = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  void snackSignup() {
    final snack = SnackBar(
      backgroundColor: AppColors.secondary,
      content: const Text(
        'تم انشاء الحساب بنجاح',
        style: TextStyle(color: AppColors.primary, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void snackSignup1() {
    final snack = SnackBar(
      backgroundColor: AppColors.secondary,
      content: const Text(
        'كلمة المرور خاطئه',
        style: TextStyle(color: AppColors.primary, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء حساب'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _keyForm,
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 300,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                  labelText: 'اسم المستخدم',
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ادخل اسم المستخدم';
                  } else if (value.length <= 3) {
                    return 'يجب ان يكون اكثر من ثلاث حروف';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'البريد الألكتروني',
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),

                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ادخل بريدك الالكتروني ';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(value)) {
                    return 'البريد الالكتروني غير صحيح';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                validator: (value) {
                  RegExp regex = RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  );
                  if (value == null || value.isEmpty) {
                    return 'ادخل كلمة مرور صحيحه';
                  } else if (value.length < 8) {
                    return 'يجب ان تكون كلمة المروور اكثر من ثمانية احرف';
                  } else if (!regex.hasMatch(value)) {
                    return ("كلمة المرور يجب أن تحتوي على حرف كبير، حرف صغير، رقم، وحرف خاص (مثل @، #، !، %). ");
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                obscureText: true,
                controller: passwordconfirm,
                decoration: InputDecoration(
                  labelText: 'تأكيد كلمة المرور',
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى تأكيد كلمة المرور';
                  } else if (value != passwordcontroller.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    if (passwordcontroller.text != passwordconfirm.text) {
                      snackSignup1();
                    } else {
                      snackSignup();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainLayout()),
                      );
                    }
                  }
                },

                child: Text('اشتراك', style: TextStyle(color: AppColors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
