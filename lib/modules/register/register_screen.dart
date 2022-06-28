// ignore_for_file: sized_box_for_whitespace

import 'package:algoriza_task1/shared/components/components.dart';
import 'package:algoriza_task1/shared/components/paths.dart';
import 'package:algoriza_task1/shared/styles/colors.dart';
import 'package:algoriza_task1/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final registrationFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .14,
                child: Stack(
                  children: [
                    Image.asset(
                      Paths.backgroundImage,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
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
                  key: registrationFormKey,
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
                            'Register',
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
                              Transform.scale(
                                scale: 0.7,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.question_mark_outlined,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? val) {},
                        placeHolder: 'Eg. example@email.com',
                      ),
                      const CustomCountryCodePicker(),
                      CustomTextFormField(
                        label: 'Password',
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? val) {},
                        placeHolder: 'Password',
                        isPassword: true,
                        suffixIcon: const Icon(
                          Icons.visibility_rounded,
                          color: Colors.black,
                        ),
                        suffixIconPressed: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextButton(
                        text: 'Register',
                        onPressed: () {},
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
                            'Has any account? ',
                            style: regularTextStyle,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {},
                            child: Text(
                              'Sign in here',
                              style: regularTextStyle.copyWith(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          'By registering your account, you are agree to our',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'terms and conditions',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
