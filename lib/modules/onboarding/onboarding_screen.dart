import 'package:algoriza_task1/modules/register/register_screen.dart';
import 'package:algoriza_task1/modules/signin/signin_screen.dart';
import 'package:algoriza_task1/shared/components/components.dart';
import 'package:algoriza_task1/shared/components/constants.dart';
import 'package:algoriza_task1/shared/components/paths.dart';
import 'package:algoriza_task1/shared/styles/colors.dart';
import 'package:algoriza_task1/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String title;
  final String description;
  final String image;

  BoardingModel(this.title, this.description, this.image);
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageViewController = PageController();
  int pageViewCurrentIndex = 0;

  String onBoardingButtonText = 'Next';

  final List<BoardingModel> boardingModels = [
    BoardingModel(
      'Get food delivery to your doorstep asap',
      'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
      Paths.onBoarding_1,
    ),
    BoardingModel(
      'Buy any food from your favorite restaurant',
      'We are constantly adding your favorite restaurant throughout the territory and around your area carefully selected',
      Paths.onBoarding_2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    navigateTo(context, RegisterScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(HexColor('#FAF2E7')),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      foreground: Paint()..color = blackColor,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 30,
                child: Image.asset(
                  Paths.logo,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .6,
                child: PageView.builder(
                  controller: pageViewController,
                  itemCount: 2,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    pageViewCurrentIndex = index;
                    if (index == boardingModels.length - 1) {
                      onBoardingButtonText = 'Login';
                    } else {
                      onBoardingButtonText = 'Next';
                    }
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return OnBoardingScreenItem(
                      boardingModel: boardingModels[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: pageViewController,
                  count: 2,
                  effect: const WormEffect(
                    dotHeight: 5,
                    dotWidth: 20,
                    activeDotColor: Colors.orangeAccent,
                    // strokeWidth: 5,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                text: onBoardingButtonText,
                onPressed: () {
                  if (pageViewCurrentIndex == boardingModels.length - 1) {
                    navigateAndFinish(context, SignInScreen());
                  } else {
                    pageViewController.animateToPage(
                      1,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
                padding: 18,
                radius: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: regularTextStyle,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      navigateTo(context, RegisterScreen());
                    },
                    child: Text(
                      'Sign Up',
                      style: regularTextStyle.copyWith(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
