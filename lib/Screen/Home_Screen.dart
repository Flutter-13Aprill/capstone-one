import 'dart:io';
import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Controllers/Language_Controller.dart';
import 'package:app_design_implementation/Screen/Login_Signup_Screen.dart';
import 'package:app_design_implementation/Screen/Main_Navigation_Screen.dart';
import 'package:app_design_implementation/Widgets/ConfirmLogout_Widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';
import 'package:app_design_implementation/Widgets/Home_Card_Widget.dart';
import 'package:app_design_implementation/Widgets/Home_Shimmer_Card_Widget.dart';

class DrawerItem {
  final String titleKey;
  final IconData icon;
  final VoidCallback? onTap;

  DrawerItem(this.titleKey, this.icon, [this.onTap]);
}

class CvTemplate {
  final String title;
  final String description;
  final String imagePath;
  final String category;

  CvTemplate({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.category,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _tabs = [
    'all',
    'professional',
    'creative',
    'modern',
    'basic',
  ];

  // Add this inside _HomeScreenState (replace your _templates list)

  final List<CvTemplate> _templates = [
    CvTemplate(
      title: 'basic_cv_title',
      description: 'basic_cv_desc',
      imagePath: 'assets/template1.png',
      category: 'basic',
    ),
    CvTemplate(
      title: 'professional_cv_title',
      description: 'professional_cv_desc',
      imagePath: 'assets/template2.png',
      category: 'professional',
    ),
    CvTemplate(
      title: 'creative_cv_title',
      description: 'creative_cv_desc',
      imagePath: 'assets/template3.png',
      category: 'creative',
    ),
    CvTemplate(
      title: 'modern_cv_title',
      description: 'modern_cv_desc',
      imagePath: 'assets/template4.png',
      category: 'modern',
    ),
  ];

  bool _isLoading = true;
  int _selectedTab = 0;
  String _searchQuery = '';
  String _userName = 'John Doe';
  String? _userImagePath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
    });
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('user_name') ?? 'John Doe';
      _userImagePath = prefs.getString('profile_image');
    });
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => ConfirmlogoutWidgets(
            onLogout: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginSignupScreen()),
              );
            },
          ),
    );
  }

  Widget gradientTitle(String text, {double fontSize = 24}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: isDark ? Colors.white : Colors.black87,
    );

    return ShaderMask(
      shaderCallback:
          (bounds) => AppThemes.titleGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Text(text, style: textStyle.copyWith(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final scaffoldBgColor =
        isDark
            ? const Color(0xFF1E1A2B)
            : AppThemes.lightTheme.scaffoldBackgroundColor;
    final appBarBgColor =
        isDark
            ? const Color(0xFF1E1A2B)
            : AppThemes.lightTheme.appBarTheme.backgroundColor!;

    List<CvTemplate> filteredTemplates =
        _templates.where((template) {
          final matchesTab =
              _selectedTab == 0 ||
              template.category.toLowerCase() == _tabs[_selectedTab];
          final matchesSearch = template.title.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
          return matchesTab && matchesSearch;
        }).toList();

    final drawerItems = [
      DrawerItem('home', Icons.home, () => Navigator.pop(context)),
      DrawerItem(isDark ? 'light_mode' : 'dark_mode', Icons.brightness_6, () {
        themeProvider.toggleTheme(isDark);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
            backgroundColor:
                isDark ? Colors.deepPurple[400] : Colors.purple[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            duration: const Duration(seconds: 2),
            content: Row(
              children: [
                Icon(Icons.brightness_6, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isDark ? "light_mode".tr() : "dark_mode".tr(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      DrawerItem('language', Icons.language, () {
        Provider.of<LanguageController>(
          context,
          listen: false,
        ).toggleLanguage(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainNavigationScreen()),
        );
      }),
      DrawerItem('Logout', Icons.logout, () {
        Navigator.pop(context);
        _confirmLogout(context);
      }),
    ];

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: appBarBgColor,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: isDark ? Colors.white : Colors.black,
                  size: 28,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: gradientTitle('cv_templates'.tr(), fontSize: 28),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor:
            isDark
                ? const Color(0xFF2A2540)
                : AppThemes.lightTheme.scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isDark
                          ? [const Color(0xFF3B3054), const Color(0xFF1E1A2B)]
                          : [Color(0xFFC3DAFE), Color(0xFFFFC3D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        _userImagePath != null &&
                                File(_userImagePath!).existsSync()
                            ? FileImage(File(_userImagePath!))
                            : const AssetImage('assets/Profile.png')
                                as ImageProvider,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _userName,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ...drawerItems.map((item) {
              return ListTile(
                leading: Icon(
                  item.icon,
                  color: isDark ? Colors.white : Colors.black,
                ),
                title: Text(
                  item.titleKey.tr(),
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: item.onTap,
              );
            }).toList(),
          ],
        ),
      ),
      body: Container(
        decoration: isDark ? null : AppThemes.gradientBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color:
                    isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (query) => setState(() => _searchQuery = query),
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.grey[300] : Colors.grey[700],
                  ),
                  hintText: 'search_cvs'.tr(),
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 43,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _tabs.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedTab;
                  return GestureDetector(
                    onTap:
                        () => setState(() {
                          _selectedTab = index;
                          _searchQuery = '';
                        }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient:
                            isSelected
                                ? const LinearGradient(
                                  colors: [
                                    Color(0xFFBFA0FF),
                                    Color(0xFF836FFF),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                                : null,
                        color:
                            isSelected
                                ? null
                                : (isDark
                                    ? const Color(0xFF2D2B40)
                                    : const Color(0xFFBFC3C8)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _tabs[index].tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              isSelected
                                  ? Colors.white
                                  : (isDark
                                      ? Colors.grey[300]
                                      : Colors.grey[700]),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            gradientTitle('trending_templates'.tr(), fontSize: 24),
            const SizedBox(height: 12),
            Expanded(
              child:
                  _isLoading
                      ? GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.72,
                        children: List.generate(
                          4,
                          (_) => const HomeShimmerCardWidget(),
                        ),
                      )
                      : GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.65,
                        children: List.generate(filteredTemplates.length, (
                          index,
                        ) {
                          final template = filteredTemplates[index];
                          return HomeCardWidget(
                            imagePath: template.imagePath,
                            title: template.title.tr(), // translation
                            description:
                                template.description.tr(), // translation
                            price: (index + 1) * 10,
                          );
                        }),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
