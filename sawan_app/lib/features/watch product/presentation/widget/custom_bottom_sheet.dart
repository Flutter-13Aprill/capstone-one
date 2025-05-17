import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/text/text_style.dart';

void showAddToCartBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.green[400],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: 100,
        child: Center(
          child: Text(
            'added_successfully'.tr(),
            style: TextStyles.alexandra700.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
    },
  );
}
