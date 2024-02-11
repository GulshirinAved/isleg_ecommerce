import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/carts/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/cart_icon.dart';

class CartCountButton extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  const CartCountButton({
    required this.cartItem,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.w,
      height: 33.h,
      margin: EdgeInsets.only(left: 5.w),
      decoration: BoxDecoration(
        color: AppColors.darkOrangeColor,
        borderRadius: AppBorderRadius().borderRadius30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartIcons(
            icon: CupertinoIcons.minus,
            isMinus: true,
            onTap: () {
              context
                  .read<CartBloc>()
                  .add(MinusButtonEvent(cartItem: cartItem));
            },
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Text(
                state.cartList[index].id == cartItem.id
                    ? state.cartList[index].quantity.toString()
                    : '0',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppFonts().fontSize15.sp,
                ),
              );
            },
          ),
          CartIcons(
            icon: CupertinoIcons.add,
            isMinus: false,
            onTap: () {
              context.read<CartBloc>().add(PlusButtonEvent(cartItem: cartItem));
            },
          ),
        ],
      ),
    );
  }
}
