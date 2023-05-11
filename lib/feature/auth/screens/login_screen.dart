import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/common/extensions/theme_extension.dart';
import 'package:whatsapp/common/helper/show_alert_dialog.dart';
import 'package:whatsapp/common/utils/app_colors.dart';
import 'package:whatsapp/common/utils/extensions.dart';
import 'package:whatsapp/common/widgets/custom_icon_button.dart';
import 'package:whatsapp/feature/auth/screens/verification_screen.dart';
import 'package:whatsapp/feature/auth/widgets/custom_text_field.dart';

import '../../../common/widgets/custom_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phoneNum = phoneNumberController.text;
    // final countryCode = countryCodeController.text;
    // final countryName = countryNameController.text;

    if (phoneNum.isEmpty) {
      return showAlertDialog(
        context: context,
        text: 'Please enter your phone number.',
      );
    } else if (phoneNum.length != 10) {
      return showAlertDialog(
        context: context,
        text: 'Please enter a valid mobile number.',
      );
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VerificationScreen()),
    );
  }

  showCountryPickerBottomSheet() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['IN'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: context.height * 0.75,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: AppColors.greenDark,
          ),
          hintText: 'Search country by code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greenDark,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'India');
    countryCodeController = TextEditingController(text: '91');
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Enter your phone number',
          style: TextStyle(color: context.theme.authAppBarTextColor),
        ),
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.1,
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'WeDoChat will need to verify your number. ',
                style: TextStyle(
                  color: context.theme.greyColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "What's my number?",
                    style: TextStyle(
                      color: context.theme.blueColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              onTap: showCountryPickerBottomSheet,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.greenDark,
                size: 22,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryPickerBottomSheet,
                    prefixText: '+',
                    readOnly: true,
                    controller: countryCodeController,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    hintText: 'Phone Number',
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Carrier charges may apply.',
              style: TextStyle(color: context.theme.greyColor),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: 'NEXT',
        width: 90,
      ),
    );
  }
}
