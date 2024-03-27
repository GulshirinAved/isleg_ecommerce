// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/cart_button.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/fav_button.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final FavItem favItem;
  final CartItem cartItem;

  const ProductCard({
    required this.favItem,
    required this.cartItem,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'productProfile',
          extra: {
            'favItem': favItem,
            'cartItem': cartItem,
            'index': index,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            Container(
              height: 210.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.8,
                    spreadRadius: 0.5,
                    color: AppColors.lightGreyColor,
                  ),
                ],
                borderRadius: AppBorderRadius().borderRadius15,
              ),
            ),
            Container(
              height: 120.h,
              width: 200.w,
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: 'http://$host/${favItem.image}',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 120.h,
                  width: 200.w,
                  margin: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    logoBlackImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 140,
              child: Container(
                width: 200.w,
                margin: const EdgeInsets.only(right: 6, left: 6),
                child: Text(
                  favItem.favName,
                  style: TextStyle(
                    color: AppColors.darkBlueColor,
                    fontSize: AppFonts().fontSize14.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              top: 180,
              child: Container(
                height: .5,
                width: 186.w,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                color: AppColors.darkBlueColor,
              ),
            ),
            favItem.favPrevious_price == '0.0'
                ? const SizedBox.shrink()
                : Positioned(
                    top: 185,
                    child: Container(
                      margin: EdgeInsets.only(left: 6.w),
                      child: Text(
                        '${favItem.favPrevious_price} manat',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.darkBlueColor,
                          fontSize: AppFonts().fontSize15.sp,
                        ),
                      ),
                    ),
                  ),
            Positioned(
              top: favItem.favPrevious_price == '0.0' ? 169.h : 175.h,
              child: Container(
                margin: const EdgeInsets.only(left: 6),
                child: Text(
                  '${favItem.favPrice} manat',
                  style: TextStyle(
                    color: AppColors.darkOrangeColor,
                    fontSize: AppFonts().fontSize20.sp,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 7,
              bottom: 5.h,
              child: CartButton(
                cartItem: cartItem,
              ),
            ),
            Positioned(
              top: -5,
              right: 2,
              child: FavButton(
                favItem: favItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
