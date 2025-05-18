import 'package:aleef/screens/login_screen.dart';
import 'package:aleef/style/style_color.dart';
import 'package:aleef/widget/language_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CareDrawer extends StatelessWidget {
  /// A custom navigation drawer
  const CareDrawer({
    super.key,
    required this.accountName,
    required this.accountEmail,
  });

  /// User's name to be shown at the top of the drawer
  final String accountName;

  /// User's email
  final String accountEmail;

  Future _launchUrl(url, BuildContext context) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.grey,
      //ListView to display a list of draw list
      child: ListView(
        padding: EdgeInsets.zero,

        children: [
          // Header showing user info
          UserAccountsDrawerHeader(
            accountName: Text(
              accountName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            accountEmail: Text(
              accountEmail,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            //Creates a circle that represents a user.
            currentAccountPicture: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),

          // About menu item
          ListTile(
            leading: Icon(Icons.info),
            title: Text('about'.tr()),
            onTap: () {
              showAboutDialog(
                context: context,
                children: [
                  Text(
                    'appName'.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'description'.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'slogan'.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            },
          ),
          // Contact menu item
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('contact'.tr()),
            onTap: () async {
              _launchUrl('https://wa.me/0595814759', context);
            },
          ),
          // Language selector with custom widget
          ListTile(
            leading: Icon(Icons.language),
            title: Text('language'.tr()),
            trailing: SizedBox(width: 100, child: LanguageButton()),
          ),
          // Logout button
          ListTile(
            leading: Icon(Icons.logout_outlined, color: StyleColor.coral),
            title: Text(
              'logout'.tr(),
              style: TextStyle(color: StyleColor.coral),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        'logout'.tr(),
                        style: TextStyle(color: StyleColor.coral),
                      ),
                      content: Text('confirmLogout'.tr()),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ),
                            );
                          },
                          child: Text("yes".tr()),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("no".tr()),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
