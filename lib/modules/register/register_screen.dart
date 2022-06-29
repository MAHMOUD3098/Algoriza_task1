// ignore_for_file: sized_box_for_whitespace

import 'package:algoriza_task1/modules/register/cubit/cubit.dart';
import 'package:algoriza_task1/modules/register/cubit/state.dart';
import 'package:algoriza_task1/modules/signin/signin_screen.dart';
import 'package:algoriza_task1/shared/components/components.dart';
import 'package:algoriza_task1/shared/components/constants.dart';
import 'package:algoriza_task1/shared/components/paths.dart';
import 'package:algoriza_task1/shared/styles/colors.dart';
import 'package:algoriza_task1/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final registrationFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: whiteColor,
            body: SingleChildScrollView(
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
                          Paths.bannerImage,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                navigateBack(context);
                              },
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
                              const CustomHelpComponent(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            label: 'Email',
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (String? val) {
                              if (val != null) {
                                if (val.isEmpty) {
                                  return 'Please enter your email.';
                                }
                              }
                            },
                            placeHolder: 'Eg. example@email.com',
                          ),
                          CustomCountryCodePicker(
                            errorBorderColor: registerCubit.countryCodePickerBorderColor,
                            validator: (String? val) {
                              if (val != null) {
                                if (val.isEmpty) {
                                  registerCubit.changeCountryCodePickerBorderColor(true);
                                  return 'Phone Number is not registered.';
                                } else {
                                  registerCubit.changeCountryCodePickerBorderColor(false);
                                }
                              }
                            },
                          ),
                          CustomTextFormField(
                            label: 'Password',
                            controller: passwordController,
                            validator: (String? val) {
                              if (val != null) {
                                if (val.isEmpty) {
                                  return 'Please enter your password.';
                                }
                              }
                            },
                            placeHolder: 'Password',
                            isPassword: registerCubit.isPassword,
                            suffixIcon: Icon(
                              registerCubit.suffixIcon,
                              color: const Color.fromARGB(255, 5, 3, 3),
                            ),
                            suffixIconPressed: () {
                              registerCubit.changePasswordVisibility();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextButton(
                            text: 'Register',
                            onPressed: () {
                              registrationFormKey.currentState!.validate();
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
                                'Has any account? ',
                                style: regularTextStyle,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  navigateTo(context, const SignInScreen());
                                },
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
          );
        },
      ),
    );
  }
}
