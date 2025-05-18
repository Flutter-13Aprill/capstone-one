import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Template_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:easy_localization/easy_localization.dart';

class CartScreen extends StatefulWidget {
  final String title;
  final double price;
  final String image;

  const CartScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<CartScreen> createState() => _CartPageState();
}

class _CartPageState extends State<CartScreen> {
  late TextEditingController _controller;
  bool _isPurchased = false;
  String? _purchasedId;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.title);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTemplate(BuildContext context) {
    final title = _controller.text.trim();
    if (title.isNotEmpty && !_isPurchased) {
      final newId = const Uuid().v4();
      Provider.of<TemplateProvider>(context, listen: false)
          .addTemplate(newId, title, widget.image, widget.price);

      setState(() {
        _isPurchased = true;
        _purchasedId = newId;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('added_to_templates'.tr(args: [title])),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _deleteTemplate(BuildContext context) {
    if (_isPurchased) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('cant_delete_after_purchase'.tr()),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (_purchasedId != null) {
      Provider.of<TemplateProvider>(context, listen: false)
          .removeTemplateById(_purchasedId!);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('cancel_purchase'.tr(args: [_controller.text])),
        backgroundColor: Colors.red,
      ),
    );

    Navigator.pop(context);
  }

  Widget _gradientTitle(String text, double fontSize) {
    return ShaderMask(
      shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: ShaderMask(
            shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: _gradientTitle('confirm_purchase'.tr(), 24),
        flexibleSpace: Container(
          decoration: isDark
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )
              : AppThemes.gradientBackground,
        ),
      ),
      body: Container(
        decoration: isDark
            ? const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              )
            : AppThemes.gradientBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Card(
                  color: theme.cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            widget.image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "\$${widget.price.toStringAsFixed(2)}",
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              if (_isPurchased)
                                Text(
                                  'purchased'.tr(),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: _isPurchased
                                          ? theme.disabledColor
                                          : Colors.greenAccent,
                                    ),
                                    onPressed: _isPurchased ? null : () => _addTemplate(context),
                                    iconSize: 32,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_forever,
                                      color: _isPurchased
                                          ? theme.disabledColor
                                          : Colors.redAccent,
                                    ),
                                    onPressed: () => _deleteTemplate(context),
                                    iconSize: 32,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_isPurchased)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.lock, color: Colors.orangeAccent),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'you_cant_delete'.tr(),
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
