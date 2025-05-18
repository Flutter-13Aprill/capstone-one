import 'package:flutter/material.dart';

// -- Widgets
import 'package:shabah/widgets/cart_screen/card_item.dart';
import 'package:shabah/widgets/cart_screen/date_picker_form.dart';
import 'package:shabah/widgets/cart_screen/empty_cart.dart';
import 'package:shabah/widgets/confirmation_bottom_sheet.dart';
import 'package:shabah/widgets/custom_button.dart';
import 'package:shabah/widgets/authentication_screen/custom_textfield.dart';
import 'package:shabah/widgets/cart_screen/address_form.dart';

// -- Controllers
import 'package:shabah/controllers/address_controller.dart';
import 'package:shabah/main.dart';
import 'package:shabah/controllers/localization_controller.dart';

// -- External Packages
import 'package:easy_localization/easy_localization.dart';

// -- Extensions
import 'package:shabah/extensions/screen_size.dart';
// -- App Theming
import 'package:shabah/style/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late final GlobalKey<FormState> _addressFormKey;
  late final GlobalKey<FormState> _datePickerFormKey;
  final GlobalKey alertKey = GlobalKey();
  late final TextEditingController _datePickerController;
  late final TextEditingController _cityController;
  late final TextEditingController _areaController;
  late final TextEditingController _noteController;

  @override
  void initState() {
    _addressFormKey = GlobalKey<FormState>();
    _datePickerFormKey = GlobalKey<FormState>();
    _datePickerController = TextEditingController();
    _noteController = TextEditingController();
    _cityController = TextEditingController();
    _areaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _datePickerController.dispose();
    _cityController.dispose();
    _areaController.dispose();
    _noteController.dispose();
    cart = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (cart != null) {
              return GestureDetector(

                onTap: () => FocusScope.of(context).unfocus(),

                child: Container(

                  margin: EdgeInsets.symmetric(horizontal: 8),

                  child: SingleChildScrollView(

                    child: Column(

                      children: [

                        Align(
                          alignment: LocalizationController.setAlignment(context: context),
                          child: Text(context.tr('cart_text'),style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.secondaryColor),),
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.02)),

                        Dismissible(
                          key: ValueKey(cart),
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.red,
                            child: Row(
                              children: [
                                Spacer(),
                                Icon(Icons.restore_from_trash,color: Colors.white,),
                              ],
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {
                              cart = null;
                            });
                          },
                          child: CardItem(),
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.03)),

                        Divider(color: Colors.blueGrey),

                        SizedBox(height: context.getHeight(multiplied: 0.03)),

                        Align(
                          alignment: LocalizationController.setAlignment(context: context),
                          child: Text(context.tr('when_your_shabah'),style: Theme.of(context,).textTheme.labelMedium!.copyWith(fontSize: 22),
                          ),
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.03)),

                        DatePickerForm(formKey: _datePickerFormKey, controller: _datePickerController),

                        SizedBox(height: context.getHeight(multiplied: 0.03)),

                        Align(
                          alignment: LocalizationController.setAlignment(context: context),
                          child: Text(context.tr('address_text'),style: Theme.of(context,).textTheme.labelMedium!.copyWith(fontSize: 22),
                          ),
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.03)),

                        AddressForm(formKey: _addressFormKey, cityController: _cityController, areaController: _areaController),

                        SizedBox(height: context.getHeight(multiplied: 0.03)),

                        Align(
                          alignment: LocalizationController.setAlignment(context: context),
                          child: Text(context.tr('notes_text'),style: Theme.of(context,).textTheme.labelMedium!.copyWith(fontSize: 22),
                          ),
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.03)),

                        CustomTextfield(
                          controller: _noteController,
                          labelText: context.tr('add_note_textfield'),
                          isNoteTextField: true,
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.08)),

                        CustomButton(
                          labelText: context.tr('pay_text'),
                          onPressed: () {
                            if (_datePickerFormKey.currentState!.validate() && _addressFormKey.currentState!.validate()) {

                              addressController = AddressController(
                                city: _cityController.text[0].toUpperCase() + _cityController.text.substring(1),
                                area: _areaController.text,
                              );

                              showConfirmationBottomSheet(context: context, alertKey: alertKey, onDone: (isDone) {
                                if(isDone){
                                  Future.delayed(Duration(seconds: 1),(){
                                    if(context.mounted){
                                      Navigator.pop(context);
                                    }
                                    
                                  });
                                  
                                }
                              },
                              );
                            }
                          },
                        ),

                        SizedBox(height: context.getHeight(multiplied: 0.08)),
                      ],
                    ),
                  ),
                ),
              );
            }

            return EmptyCart();
          },
        ),
      ),
    );
  }
}
