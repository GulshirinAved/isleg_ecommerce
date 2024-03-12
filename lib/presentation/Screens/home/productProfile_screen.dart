import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/cartCount_button.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/cart_button.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/fav_button.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/divider.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/productdesc_card.dart';

class ProductProfileScreen extends StatelessWidget {
  final FavItem favItem;
  final CartItem cartItem;
  final int index;
  const ProductProfileScreen({
    required this.favItem,
    required this.cartItem,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(number: 3),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 300.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: AppBorderRadius().borderRadius15,
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: AppColors.lightGreyColor1,
                        width: 0.2,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              IconlyBold.arrowLeftCircle,
                              color: AppColors.darkBlueColor,
                              size: 27,
                            ),
                          ),
                          FavButton(favItem: favItem),
                        ],
                      ),
                      CachedNetworkImage(
                        imageUrl: 'http://$host/${favItem.image}',
                        height: 275.h,
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
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: AppBorderRadius().borderRadius15,
                  border: Border.all(
                    color: AppColors.lightGreyColor1,
                    width: 0.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      favItem.favName,
                      style: TextStyle(
                        color: AppColors.darkBlueColor,
                        fontSize: AppFonts().fontSize20.sp,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: DividerLine(
                        context,
                        color: AppColors.greyColor,
                      ),
                    ),
                    const ProductDesc(
                      leftTitle: 'Haryt kody',
                      rightTitle: 'GRS49069',
                    ),
                    ProductDesc(
                      leftTitle: 'Brend',
                      rightTitle: 'Bianyo',
                      color: AppColors.darkOrangeColor,
                    ),
                    const ProductDesc(
                      leftTitle: 'Barkod',
                      rightTitle: '14314672',
                    ),
                    ProductDesc(
                      leftTitle: 'Möçberi',
                      rightTitle: '12 sany',
                      color: AppColors.darkOrangeColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: DividerLine(
                        context,
                        color: AppColors.greyColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${favItem.favPrevious_price} manat',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.greyBlueColor,
                                fontSize: AppFonts().fontSize15.sp,
                              ),
                            ),
                            Text(
                              '${favItem.favPrice} manat',
                              style: TextStyle(
                                color: AppColors.darkOrangeColor,
                                fontSize: AppFonts().fontSize20.sp,
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            final bool itemInCart = state.cartList
                                .any((element) => element.id == cartItem.id);

                            if (itemInCart) {
                              final int index = state.cartList.indexWhere(
                                (element) => element.id == cartItem.id,
                              );
                              if (index != -1) {
                                return CartCountButton(
                                  cartItem: state.cartList[index],
                                  index: index,
                                );
                              }
                            }

                            return CartButton(cartItem: cartItem);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
