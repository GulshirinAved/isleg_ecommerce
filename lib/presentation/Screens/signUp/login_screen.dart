import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/blocs/signup/passwordObscure/password_obscure_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/textFields.dart';
import 'package:isleg_ecommerce/presentation/Screens/signUp/components/sign_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(number: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                'Açar sözi unutdym',
                style: TextStyle(
                  color: AppColors.darkOrangeColor,
                  fontSize: AppFonts().fontSize13,
                ),
              ),
              SignButton(
                orangeTitle: 'Ulgama girmek',
                orangeOnTap: () {},
                title: 'Agza bolmak',
                titleTap: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
