import 'package:flutter/material.dart';
import 'package:whatsapp/common/extensions/theme_extension.dart';
import 'package:whatsapp/common/utils/app_colors.dart';

showAlertDialog({
  required BuildContext context,
  required String text,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          text,
          style: TextStyle(
            color: context.theme.greyColor,
            fontSize: 15,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: AppColors.greenDark,
              ),
            ),
          ),
        ],
      );
    },
  );
}
