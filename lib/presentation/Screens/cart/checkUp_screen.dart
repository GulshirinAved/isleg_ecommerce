// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/agree.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/confirm_buttons.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/deliveryTime.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/payment.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/textFields.dart';

class CheckUpScreen extends StatelessWidget {
  CheckUpScreen({
    Key? key,
  }) : super(key: key);

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
              SizedBox(
                height: 7.h,
              ),
              TextFields(
                prefixIcon: Icon(
                  IconlyBold.profile,
                  color: AppColors.greyColor,
                ),
                hintText: 'Adyňyz',
              ),
              TextFields(
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
                isNumber: true,
              ),
              TextFields(
                prefixIcon: Icon(
                  IconlyBold.document,
                  color: AppColors.greyColor,
                ),
                hintText: 'Salgyňyz',
                isAdress: true,
              ),
              TextFields(
                prefixIcon: Icon(
                  IconlyBold.infoCircle,
                  color: AppColors.greyColor,
                ),
                hintText: 'Bellik',
              ),
              const Payment(),
              const DeliveryTime(),
              const Agree(),
              const ConfirmButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
