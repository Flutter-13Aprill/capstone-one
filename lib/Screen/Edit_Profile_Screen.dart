import 'dart:io';
import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Providers/Them_Provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('user_name') ?? 'John Doe';
      _emailController.text = prefs.getString('user_email') ?? 'johndoe@gmail.com';
      final savedImagePath = prefs.getString('profile_image');
      if (savedImagePath != null && File(savedImagePath).existsSync()) {
        _profileImage = XFile(savedImagePath);
      }
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
      });
    }
  }

  Future<void> _saveChanges() async {
    final prefs = await SharedPreferences.getInstance();
    final newName = _nameController.text.trim();
    final newEmail = _emailController.text.trim();

    if (newName.isEmpty || newEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text("empty_fields_warning".tr())),
            ],
          ),
          backgroundColor: Colors.deepOrangeAccent,
          behavior: SnackBarBehavior.floating,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          duration: const Duration(seconds: 4),
        ),
      );
      return;
    }

    await prefs.setString('user_name', newName);
    await prefs.setString('user_email', newEmail);
    if (_profileImage != null && File(_profileImage!.path).existsSync()) {
      await prefs.setString('profile_image', _profileImage!.path);
    }

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: ShaderMask(
            shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
          child: Text(
            'edit_profile'.tr(),
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        flexibleSpace: Container(
          decoration: isDark ? _buildDarkGradient() : AppThemes.gradientBackground,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: isDark ? _buildDarkGradient() : AppThemes.gradientBackground,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: _profileImage != null && File(_profileImage!.path).existsSync()
                      ? FileImage(File(_profileImage!.path))
                      : const AssetImage('assets/Profile.png') as ImageProvider,
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt, size: 36, color: textColor)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                style: TextStyle(color: textColor),
                decoration: _inputDecoration('name'.tr(), textColor),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                style: TextStyle(color: textColor),
                decoration: _inputDecoration('email'.tr(), textColor),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  gradient: AppThemes.titleGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    'save_changes'.tr(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, Color textColor) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: textColor.withOpacity(0.3))),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: textColor)),
    );
  }

  BoxDecoration _buildDarkGradient() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
}
