import 'package:algoriza_task1/modules/onborading/onboarding_screen.dart';
import 'package:algoriza_task1/shared/styles/colors.dart';
import 'package:algoriza_task1/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingScreenItem extends StatelessWidget {
  final BoardingModel boardingModel;
  const OnBoardingScreenItem({
    Key? key,
    required this.boardingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .5,
          child: Image.asset(
            boardingModel.image,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          boardingModel.title,
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            boardingModel.description,
            style: descriptionTextStyle.copyWith(color: greyColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;

  const CustomTextButton({Key? key, required this.text, this.onPressed, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 18,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color ?? Colors.teal),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          onPressed;
        },
        child: Text(
          text,
          style: TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
