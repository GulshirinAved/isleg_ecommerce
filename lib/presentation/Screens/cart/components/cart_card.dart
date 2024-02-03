// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/cart_icon.dart';

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  const CartCard({
    Key? key,
    required this.cartItem,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: 86.h,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius().borderRadius15,
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            margin: EdgeInsets.only(left: 10.w, right: 7.w),
            color: AppColors.whiteColor,
            child: Image.asset(
              productImage,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    width: MediaQuery.of(context).size.width - 210,
                    child: Text(
                      cartItem.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.darkBlueColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.clear_circled,
                        color: AppColors.darkOrangeColor,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '${cartItem.previous_price} manat',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.darkGreyColor,
                  fontSize: AppFonts().fontSize15.sp,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 115,
                    child: Text(
                      '${cartItem.price} manat',
                      style: TextStyle(
                        color: AppColors.darkOrangeColor,
                        fontSize: AppFonts().fontSize19.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: 107.w,
                    height: 33.h,
                    margin: EdgeInsets.only(left: 11.w),
                    decoration: BoxDecoration(
                      color: AppColors.darkOrangeColor,
                      borderRadius: AppBorderRadius().borderRadius30,
                    ),
                    child: CardButton(
                      cartItem: cartItem,
                      index: index,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  const CardButton({
    Key? key,
    required this.cartItem,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CartIcons(
              icon: CupertinoIcons.minus,
              isMinus: true,
              onTap: () {
                context
                    .read<CartBloc>()
                    .add(MinusButtonEvent(cartItem: cartItem));
              },
            );
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Text(
              state.cartList[index].id == cartItem.id
                  ? state.cartList[index].quantity.toString()
                  : "0",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppFonts().fontSize15.sp,
              ),
            );
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CartIcons(
              icon: CupertinoIcons.add,
              isMinus: false,
              onTap: () {
                context
                    .read<CartBloc>()
                    .add(PlusButtonEvent(cartItem: cartItem));
              },
            );
          },
        ),
      ],
    );
  }
}
