import 'package:flutter/material.dart';
import 'package:whatsapp/common/extensions/theme_extension.dart';
import 'package:whatsapp/common/utils/extensions.dart';
import 'package:whatsapp/feature/auth/screens/login_screen.dart';

import '../widgets/language_button.dart';
import '../widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.1,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.05,
                  ),
                  child: Image.asset(
                    'assets/images/welcome_page_illustration.png',
                    color: context.theme.circleImageColor,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to WeDoChat',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                const PrivacyAndTerms(),
                const SizedBox(height: 40),
                SizedBox(
                  width: context.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text('Agree and continue'),
                  ),
                ),
                const SizedBox(height: 40),
                const LanguageButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
