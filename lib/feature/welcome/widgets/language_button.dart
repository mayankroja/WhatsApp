import 'package:flutter/material.dart';
import 'package:whatsapp/common/extensions/theme_extension.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/custom_icon_button.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({Key? key}) : super(key: key);
  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.theme.greyColor!.withOpacity(0.4),
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  CustomIconButton(
                    onPressed: () => Navigator.pop(context),
                    iconColor: context.theme.greyColor,
                    icon: Icons.close,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "App Language ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                height: 0.5,
                color: context.theme.greyColor!.withOpacity(0.3),
              ),
              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (value) {},
                activeColor: AppColors.greenDark,
                title: const Text('English'),
                subtitle: Text(
                  "(Phone's Language)",
                  style: TextStyle(color: context.theme.greyColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(
          context,
        ),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.langHighlightColor,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.language,
                color: AppColors.greenDark,
              ),
              SizedBox(width: 10),
              Text(
                'English',
                style: TextStyle(
                  color: AppColors.greenDark,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.greenDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
