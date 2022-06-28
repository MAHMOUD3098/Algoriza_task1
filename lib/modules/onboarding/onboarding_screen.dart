import 'package:algoriza_task1/shared/components/components.dart';
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

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final PageController onBoardingPageController = PageController();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(HexColor('#C4A484')),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      foreground: Paint()..color = whiteColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: onBoardingPageController,
                  itemCount: 2,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == boardingModels.length - 1) {
                      onBoardingButtonText = 'Login';
                    }
                  },
                  itemBuilder: (context, index) {
                    return OnBoardingScreenItem(
                      boardingModel: boardingModels[index],
                    );
                  },
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: onBoardingPageController,
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
                height: 5,
              ),
              const CustomTextButton(text: 'onBoardingButtonText', onPressed: null),
              const SizedBox(
                height: 5,
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
                    onTap: () {},
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
