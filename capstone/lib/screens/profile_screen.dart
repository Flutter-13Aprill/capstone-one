import 'package:capstone/extensions/size.dart';
import 'package:capstone/widgets/containers/profile_containers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

//here is the profile screen
//which contains the following
//profile picture
//name 
//5 options

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(alignment: Alignment.center, child: Text('appbarProfile'.tr())),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(clipBehavior: Clip.hardEdge,
              width: context.getWidth()*0.352,
              height: context.getHieght()*0.152,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
                
              ),
              child: Image.asset('assets/images/jake.jpg',fit: BoxFit.contain,),
            ),
            SizedBox(height: 10,),
            Text('JNF',style: TextStyle(fontSize: 20),),
            SizedBox(height: 50),
            Container(
              width: context.getWidth() * 0.65,
              height: context.getHieght() * 0.35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 172, 173, 173),
                borderRadius: BorderRadius.circular(25),
              ),

              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileContainers(
                      setOption: 'changeTheme'.tr(),
                      setIcon: Icon(Icons.change_circle),
                      setIconColor: Colors.white,
                    ),
                    Divider(),
                    //here where the language is changed
                    ProfileContainers(
                      setOption: 'changeLanguage'.tr(),
                      onPressed: () {
                        if (context.locale.languageCode == "ar") {
                          context.setLocale(Locale('en', 'US'));
                        } else {
                          context.setLocale(Locale('ar', 'AR'));
                        }
                      },

                      setIcon: Icon(Icons.language),
                      setIconColor: Colors.white,
                    ),

                    Divider(),
                    ProfileContainers(
                      setOption: 'privacy'.tr(),
                      setIcon: Icon(Icons.privacy_tip),
                      setIconColor: Colors.white,
                    ),

                    Divider(),
                    ProfileContainers(
                      setOption: 'about'.tr(),
                      setIcon: Icon(Icons.info),
                      setIconColor: Colors.white,
                    ),

                    Divider(),
                    ProfileContainers(
                      setOption: 'logout'.tr(),
                      setIcon: Icon(Icons.exit_to_app),
                      setIconColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
