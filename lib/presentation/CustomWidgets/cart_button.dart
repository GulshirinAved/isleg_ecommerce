// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';

class CartButton extends StatelessWidget {
  final CartItem cartItem;
  const CartButton({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.w,
      width: 35.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkOrangeColor,
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          print('${state.cartList} it is cart Button');

          return IconButton(
            onPressed: () {
              if (state.cartList.contains(cartItem) == false) {
                context.read<CartBloc>().add(AddEvent(cartItem: cartItem));
              }
            },
            icon: Icon(
              Icons.shopping_cart,
              color: AppColors.whiteColor,
              size: 18.h,
            ),
          );
        },
      ),
    );
  }
}
