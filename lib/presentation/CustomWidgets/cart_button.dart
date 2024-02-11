// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/carts/cart/cart_bloc.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';

class CartButton extends StatelessWidget {
  final cartItem;

  const CartButton({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final isItemInCart =
            state.cartList.any((item) => item.id == cartItem.id);

        return Container(
          height: 35.w,
          width: 35.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.darkOrangeColor,
          ),
          child: IconButton(
            onPressed: () {
              if (!isItemInCart) {
                context.read<CartBloc>().add(AddCartEvent(cartItem: cartItem));
              }
            },
            icon: Icon(
              Icons.shopping_cart,
              color: AppColors.whiteColor,
              size: 18.h,
            ),
          ),
        );
      },
    );
  }
}
