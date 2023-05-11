import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/app_colors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme =>
      Theme.of(this).extension<CustomThemeExtension>()!;
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBgColor;
  final Color? langHighlightColor;
  final Color? authAppBarTextColor;

  const CustomThemeExtension({
    this.authAppBarTextColor,
    this.langBgColor,
    this.langHighlightColor,
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
  });

  static const lightMode = CustomThemeExtension(
    authAppBarTextColor: AppColors.greenLight,
    circleImageColor: Color(0xFF25D366),
    blueColor: AppColors.blueLight,
    greyColor: AppColors.greyLight,
    langBgColor: Color(0xFFF7F8FA),
    langHighlightColor: Color(0xFFE8E8ED),
  );
  static const darkMode = CustomThemeExtension(
    authAppBarTextColor: Color(0xFFE9EDEF),
    circleImageColor: AppColors.greenDark,
    blueColor: AppColors.blueDark,
    greyColor: AppColors.greyDark,
    langBgColor: Color(0xFF182229),
    langHighlightColor: Color(0xFF09141A),
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? blueColor,
    Color? greyColor,
    Color? circleImageColor,
    Color? authAppBarTextColor,
    Color? langHighlightColor,
  }) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      blueColor: blueColor ?? this.blueColor,
      greyColor: greyColor ?? this.greyColor,
      authAppBarTextColor: authAppBarTextColor ?? this.authAppBarTextColor,
      langHighlightColor: langHighlightColor ?? this.langHighlightColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
        circleImageColor:
            Color.lerp(circleImageColor, other.circleImageColor, t),
        greyColor: Color.lerp(greyColor, other.greyColor, t),
        blueColor: Color.lerp(blueColor, other.blueColor, t),
        authAppBarTextColor:
            Color.lerp(authAppBarTextColor, other.authAppBarTextColor, t));
  }
}
