// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/divider.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/makeOrder_button.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/priceText.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<CartBloc>().add(SumProductEvent(cartItem: null));
        showModalBottomSheet(
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
                          fontSize: AppFonts().fontSize18,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: PriceText(
                        leftName: 'Eltip berme',
                        price: '15 TMT',
                        fontSize: AppFonts().fontSize18,
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
                            fontSize: AppFonts().fontSize20,
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
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.darkOrangeColor,
          borderRadius: AppBorderRadius().borderRadius30,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'Sargyt etmek',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppFonts().fontSize18.sp,
                ),
              ),
            ),
            Icon(
              IconlyLight.arrowRightCircle,
              color: AppColors.whiteColor,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
