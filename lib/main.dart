import 'package:flutter/material.dart';
import 'package:whatsapp/feature/welcome/screens/welcome_page.dart';
import 'package:whatsapp/common/themes/dark_theme.dart';

import 'common/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: lightTheme(),
      darkTheme: darktheme(),
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
    );
  }
}
