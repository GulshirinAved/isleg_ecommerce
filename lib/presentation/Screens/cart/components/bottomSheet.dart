import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/carts/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/divider.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/makeOrder_button.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/priceText.dart';

Future<dynamic> bottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: AppColors.orangeColor,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: 200.h,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return PriceText(
                    leftName: 'Bahasy',
                    price: state.sum.toString(),
                    fontSize: AppFonts().fontSize18.sp,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: PriceText(
                  leftName: 'Eltip berme',
                  price: '15 TMT',
                  fontSize: AppFonts().fontSize18.sp,
                ),
              ),
              divider(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return PriceText(
                      leftName: 'Jemi:',
                      price: '${state.sumDelivery} TMT',
                      fontSize: AppFonts().fontSize20.sp,
                    );
                  },
                ),
              ),
              const MakeOrderButton(),
            ],
          ),
        ),
      );
    },
  );
}
