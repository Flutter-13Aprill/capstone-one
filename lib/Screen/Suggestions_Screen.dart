import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String _selectedType = 'bug_report';

  final List<String> _suggestionTypes = [
    'bug_report',
    'feature_request',
    'general_feedback',
    'other'
  ];

  Future<void> _submitSuggestion() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('last_feedback_type', _selectedType);
      await prefs.setString('last_feedback_message', _messageController.text.trim());

      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text("thanks_feedback".tr())),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          duration: const Duration(seconds: 3),
        ),
      );
    }
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
            'suggestions_title'.tr(),
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
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle("suggestions_heading".tr(), textColor),
                const SizedBox(height: 6),
                Text(
                  "suggestions_subheading".tr(),
                  style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 14),
                ),
                const SizedBox(height: 30),

                _buildInputField(_nameController, "your_name".tr(), textColor, isRequired: true),
                const SizedBox(height: 16),
                _buildInputField(_emailController, "email_optional".tr(), textColor),
                const SizedBox(height: 16),
                _buildInputField(_subjectController, "subject".tr(), textColor, isRequired: true),
                const SizedBox(height: 16),

                _dropdownField(textColor),
                const SizedBox(height: 16),

                _buildInputField(_messageController, "message_description".tr(), textColor, isRequired: true, maxLines: 6),

                const SizedBox(height: 30),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: AppThemes.titleGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: _submitSuggestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        'submit_feedback'.tr(),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
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

  Widget _sectionTitle(String title, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label, Color color,
      {bool isRequired = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: color),
      decoration: _inputDecoration(label, color),
      validator: (value) {
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return 'field_required'.tr();
        }
        return null;
      },
    );
  }

  Widget _dropdownField(Color textColor) {
  final isDark = context.read<ThemeProvider>().isDarkMode;

  final dropdownBgColor = isDark
      ? const Color(0xFF3E2C64)
      : const Color(0xFFE9F0FF);

  final dropdownItemTextColor = isDark ? Colors.white : Colors.black;
  final selectedItemColor = isDark ? const Color(0xFF6C4ED4) : const Color(0xFFD0D8FF);

  return DropdownButtonFormField<String>(
    value: _selectedType,
    dropdownColor: dropdownBgColor,
    style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
    iconEnabledColor: textColor,
    decoration: _inputDecoration('feedback_type'.tr(), textColor),
    items: _suggestionTypes.map((type) {
      final isSelected = type == _selectedType;
      return DropdownMenuItem<String>(
        value: type,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isSelected ? selectedItemColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.deepPurpleAccent : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Text(
            type.tr(),
            style: TextStyle(
              color: dropdownItemTextColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      );
    }).toList(),
    onChanged: (value) {
      if (value != null) {
        setState(() => _selectedType = value);
      }
    },
  );
}

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
