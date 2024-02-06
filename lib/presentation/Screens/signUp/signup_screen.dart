import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/signup/passwordObscure/password_obscure_bloc.dart';
import 'package:isleg_ecommerce/blocs/signup/signin_agree/signin_agree_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/textFields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(number: 3),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFields(
              prefixIcon: Icon(
                IconlyBold.profile,
                color: AppColors.greyColor,
              ),
              hintText: 'Adyňyz',
              isObscure: null,
            ),
            TextFields(
              isNumber: true,
              prefixIcon: Container(
                margin: const EdgeInsets.only(top: 3),
                child: Text(
                  '+993',
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              hintText: 'Telefon',
              isObscure: null,
            ),
            BlocBuilder<PasswordObscureBloc, PasswordObscureState>(
              builder: (context, state) {
                return TextFields(
                  prefixIcon: Icon(
                    IconlyBold.lock,
                    color: AppColors.greyColor,
                  ),
                  hintText: 'Açar söz',
                  isObscure: state.isObscure,
                  onTap: () {
                    return context
                        .read<PasswordObscureBloc>()
                        .add(const PasswordEvent());
                  },
                );
              },
            ),
            BlocBuilder<PasswordObscureBloc, PasswordObscureState>(
              builder: (context, state) {
                return TextFields(
                  prefixIcon: Icon(
                    IconlyBold.lock,
                    color: AppColors.greyColor,
                  ),
                  hintText: 'Açar sözi tassykla',
                  isObscure: state.isObscure1,
                  onTap: () {
                    return context
                        .read<PasswordObscureBloc>()
                        .add(const PasswordConfirmEvent());
                  },
                );
              },
            ),
            BlocBuilder<SigninAgreeBloc, SigninAgreeState>(
              builder: (context, state) {
                return CheckboxListTile(
                  activeColor: AppColors.darkOrangeColor,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Şahsy maglumatlarymyň gaýtadan işlenmegi hakda habarly bolmagym üçin telefona iberilmegini kabul edýärin.',
                    style: TextStyle(
                      fontSize: AppFonts().fontSize15.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  value: state.value,
                  onChanged: (value) {
                    context
                        .read<SigninAgreeBloc>()
                        .add(ChangeSigninAgreeEvent(value: value!));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
