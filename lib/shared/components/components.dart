import 'package:algoriza_task1/modules/onboarding/onboarding_screen.dart';
import 'package:algoriza_task1/shared/styles/colors.dart';
import 'package:algoriza_task1/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
        Expanded(
          flex: 2,
          child: Image.asset(
            boardingModel.image,
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * .4,
          ),
        ),
        Expanded(
          child: Column(
            children: [
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
          ),
        )
      ],
    );
  }
}

class CustomTextButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final double? width;
  final double padding;
  final double? radius;

  const CustomTextButton({Key? key, required this.text, required this.onPressed, this.color, this.width, this.padding = 12, this.radius})
      : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: widget.width ?? double.infinity,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: widget.padding,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(widget.color ?? customButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 5),
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final String? placeHolder;
  final double? verticalPadding;
  final Icon? suffixIcon;
  final Function()? suffixIconPressed;
  final bool isPassword;
  final String label;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.label,
    this.type,
    this.placeHolder,
    this.onTap,
    this.verticalPadding,
    this.suffixIcon,
    this.suffixIconPressed,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: descriptionTextStyle.copyWith(
              color: gray_1,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            keyboardType: type,
            obscureText: isPassword,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTap: onTap,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              hintText: placeHolder,
              hintStyle: descriptionTextStyle.copyWith(color: placeHolderTextColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: textFormFieldBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: textFormFieldBorderColor),
              ),
              filled: true,
              fillColor: textFormFieldFillColor,
              suffixIcon: suffixIcon == null
                  ? null
                  : InkWell(
                      onTap: suffixIconPressed,
                      child: suffixIcon,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCountryCodePicker extends StatelessWidget {
  final String? Function(String?)? validator;
  final Color errorBorderColor;
  const CustomCountryCodePicker({Key? key, required this.validator, required this.errorBorderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: descriptionTextStyle.copyWith(
            color: gray_1,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: textFormFieldFillColor,
            border: Border.all(color: errorBorderColor),
          ),
          child: InternationalPhoneNumberInput(
            initialValue: PhoneNumber(
              isoCode: PhoneNumber.getISO2CodeByPrefix('+81'),
            ),
            spaceBetweenSelectorAndTextField: 0,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            selectorButtonOnErrorPadding: 0,
            keyboardType: TextInputType.phone,
            onInputChanged: (PhoneNumber number) {},
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
              showFlags: false,
              trailingSpace: false,
            ),
            inputDecoration: InputDecoration.collapsed(
              hintText: 'Eg. 812345678',
              hintStyle: descriptionTextStyle.copyWith(
                color: placeHolderTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSocialMediaLoginButton extends StatelessWidget {
  final String icon;
  final String text;
  final Color? color;

  const CustomSocialMediaLoginButton({
    Key? key,
    required this.icon,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color ?? whiteColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: Colors.blue,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 30,
                height: 30,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHelpComponent extends StatelessWidget {
  const CustomHelpComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
