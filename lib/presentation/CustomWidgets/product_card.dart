import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/fav_button.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
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
            height: 130.h,
            width: 200.w,
            alignment: Alignment.center,
            child: Image.asset(
              productImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 140,
            child: Container(
              width: 200.w,
              margin: const EdgeInsets.only(right: 6, left: 6),
              child: Text(
                productList[index]['name'],
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
              width: 200,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              color: AppColors.darkBlueColor,
            ),
          ),
          Positioned(
            top: 185,
            child: Container(
              margin: EdgeInsets.only(left: 6.w),
              child: Text(
                '${productList[index]['price']} manat',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.darkBlueColor,
                  fontSize: AppFonts().fontSize15.sp,
                ),
              ),
            ),
          ),
          Positioned(
            top: 205,
            child: Container(
              margin: const EdgeInsets.only(left: 6),
              child: Text(
                '${productList[index]['previous_price']} manat',
                style: TextStyle(
                  color: AppColors.darkOrangeColor,
                  fontSize: AppFonts().fontSize20.sp,
                ),
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 9,
            child: Container(
              height: 38.w,
              width: 38.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.darkOrangeColor),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: -5,
            right: 2,
            child: FavButton(
              id: productList[index]['id'],
            ),
          ),
        ],
      ),
    );
  }
}
