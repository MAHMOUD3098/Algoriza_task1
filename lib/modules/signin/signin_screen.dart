import 'package:algoriza_task1/modules/register/register_screen.dart';
import 'package:algoriza_task1/shared/components/components.dart';
import 'package:algoriza_task1/shared/components/constants.dart';
import 'package:algoriza_task1/shared/components/paths.dart';
import 'package:algoriza_task1/shared/styles/colors.dart';
import 'package:algoriza_task1/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final signinFormKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberController = TextEditingController();

  HexColor countryCodePickerBorderColor = textFormFieldBorderColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .33,
              child: Image.asset(
                Paths.bannerImage,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Form(
                key: signinFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome to Fashion Daily',
                      style: descriptionTextStyle.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in',
                          style: descriptionTextStyle.copyWith(
                            fontSize: 40,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: HexColor('#3486FE'),
                              ),
                              child: Icon(
                                Icons.question_mark_outlined,
                                color: whiteColor,
                                size: 18,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomCountryCodePicker(
                      errorBorderColor: countryCodePickerBorderColor,
                      validator: (String? val) {
                        if (val != null) {
                          if (val.isEmpty) {
                            countryCodePickerBorderColor = HexColor('#FF3756');
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {});
                            });
                            return 'Phone number is not registered.';
                          } else {
                            countryCodePickerBorderColor = textFormFieldBorderColor;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {});
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextButton(
                      text: 'Sign in',
                      onPressed: () {
                        signinFormKey.currentState!.validate();
                      },
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Or',
                            textAlign: TextAlign.center,
                            style: descriptionTextStyle.copyWith(color: Colors.grey),
                          ),
                        ),
                        const Expanded(
                          flex: 3,
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CustomSocialMediaLoginButton(
                        icon: Paths.googleImage,
                        text: 'Sign with by google',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Doesn\'t has any account? ',
                          style: regularTextStyle,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            navigateTo(context, RegisterScreen());
                          },
                          child: Text(
                            'Register here',
                            style: regularTextStyle.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Use the application according to policy rules, Any kind of violations will be subject to sanctions.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
