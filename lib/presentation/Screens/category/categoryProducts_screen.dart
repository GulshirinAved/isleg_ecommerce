import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/categoryProduct_bloc/category_product_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/product_card.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/filtering.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/sorting.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String name;
  final String id;

  const CategoryProductsScreen({
    required this.name,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        number: 1,
        needIcon: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.lightGreyColor1.withOpacity(0.5),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Sorting(
                  id: id,
                  name: name,
                ),
                SizedBox(
                  width: 165.w,
                  child: Text(
                    name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.darkBlueColor,
                      fontSize: AppFonts().fontSize18,
                    ),
                  ),
                ),
                const Filtering(),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 190,
            child: BlocBuilder<CategoryProductBloc, CategoryProductState>(
              builder: (context, state) {
                if (state is CategoryProductError) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else if (state is CategoryProductInitial) {
                  return const Center(
                    child: Text('It is initial'),
                  );
                } else if (state is CategoryProductLoading) {
                  return const Center(
                    child: Text('It is loading'),
                  );
                } else if (state is CategoryProductLoaded) {
                  if (state.categoryProductList.isEmpty) {
                    return const Center(
                      child: Text('it is empty'),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.categoryProductList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220.h,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: BlocBuilder<FavButtonBloc, FavButtonState>(
                          builder: (context, stateFav) {
                            return ProductCard(
                              favItem: FavItem(
                                favId: id,
                                favName: state.categoryProductList[index]
                                    .translations[1].tm.name,
                                favPrice: state.categoryProductList[index].price
                                    .toString(),
                                favPrevious_price: state
                                    .categoryProductList[index].oldPrice
                                    .toString(),
                                image:
                                    state.categoryProductList[index].mainImage,
                                brendName: state.categoryProductList[index]
                                        .brend.name ??
                                    '',
                                limitAmount: state
                                    .categoryProductList[index].limitAmount,
                              ),
                              cartItem: CartItem(
                                id: id,
                                name: state.categoryProductList[index]
                                    .translations[1].tm.name,
                                price: state.categoryProductList[index].price
                                    .toString(),
                                previous_price: state
                                    .categoryProductList[index].oldPrice
                                    .toString(),
                                image:
                                    state.categoryProductList[index].mainImage,
                              ),
                              index: index,
                            );
                          },
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
