import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/extensions.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.width,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final double? width;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: width ?? context.width - 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
