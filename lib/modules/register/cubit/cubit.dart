import 'package:algoriza_task1/modules/register/cubit/state.dart';
import 'package:algoriza_task1/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_rounded;
  bool isPassword = true;

  HexColor countryCodePickerBorderColor = textFormFieldBorderColor;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded;
    emit(RegisterChangePasswordVisibilityState());
  }

  void changeCountryCodePickerBorderColor(bool isError) {
    countryCodePickerBorderColor = isError ? HexColor('#FF3756') : textFormFieldBorderColor;
    emit(ChangeCountryCodePickerBorderColorState());
  }
}
