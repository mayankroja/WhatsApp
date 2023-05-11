import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color? iconColor;
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        color: iconColor ?? Theme.of(context).appBarTheme.iconTheme?.color,
      ),
      onPressed: onPressed,
    );
  }
}
