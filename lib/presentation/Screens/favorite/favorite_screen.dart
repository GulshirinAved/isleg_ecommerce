// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/cart/cart_bloc.dart';

import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/empty_warn.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        number: 3,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartstate) {
          return BlocBuilder<FavButtonBloc, FavButtonState>(
            builder: (context, state) {
              if (state is FavButtonInitial || state.favList.isEmpty) {
                return EmptyWarn(
                  icon: heart,
                  topTitle: 'Halanan haryt ýok',
                  desc: 'Ilki halan harytlaryňyzy gosuň',
                );
              } else {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 215.h,
                    ),
                    itemCount: state.favList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ProductCard(
                          favList: state.favList,
                          index: index,
                          favItem: FavItem(
                            id: state.favList[index].id,
                            name: state.favList[index].name,
                            price: state.favList[index].price,
                            previous_price: state.favList[index].previous_price,
                            isNew: state.favList[index].isNew,
                          ),
                          cartItem: CartItem(
                            id: cartstate.cartList[index].id,
                            name: cartstate.cartList[index].name,
                            price: cartstate.cartList[index].price,
                            previous_price:
                                cartstate.cartList[index].previous_price,
                            isNew: cartstate.cartList[index].isNew,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
