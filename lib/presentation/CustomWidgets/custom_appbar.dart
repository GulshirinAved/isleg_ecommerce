// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:isleg_ecommerce/blocs/carts/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget implements PreferredSize {
  final int number;
  VoidCallback? onTap;
  bool? needIcon;
  CustomAppbar({
    Key? key,
    required this.number,
    this.onTap,
    this.needIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 2,
      title: SvgPicture.asset(
        logoImages,
        height: 50.h,
        fit: BoxFit.cover,
      ),
      leading: needIcon == true
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                IconlyLight.arrowLeftSquare,
                color: AppColors.darkOrangeColor,
              ))
          : const SizedBox(),
      actions: [
        number == 1
            ? iconSearch()
            : number == 2
                ? iconDelete(context)
                : const SizedBox(),
      ],
      centerTitle: true,
    );
  }

  Widget iconDelete(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              context.read<CartBloc>().add(
                    RemoveCartAllEvent(
                      cartItem: CartItem(
                          id: '1',
                          name: '',
                          price: '',
                          previous_price: '',
                          image: productImage),
                    ),
                  );
            },
            icon: Icon(
              IconlyBold.delete,
              color: AppColors.darkOrangeColor,
              size: 25.h,
            ),
          );
        },
      ),
    );
  }

  Widget iconSearch() {
    return Container(
      height: 38.w,
      width: 38.w,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: AppColors.orangeColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          search,
          height: 22.w,
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
