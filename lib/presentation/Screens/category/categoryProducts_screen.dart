import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/product_card.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/filtering.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/mainTitle.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/sorting.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/productBanner_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        number: 1,
        needIcon: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(
                  color: AppColors.lightGreyColor1.withOpacity(0.5),
                ),
              ),
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Sorting(),
                  MainTitle(title: 'Ýazuw'),
                  Filtering(),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, left: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 215.h,
                ),
                itemBuilder: (context, index) {
                  return productList[index]['isNew'] == false
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: BlocBuilder<FavButtonBloc, FavButtonState>(
                            builder: (context, state) {
                              return ProductCard(
                                favList: state.favList,
                                favItem: FavItem(
                                  favId: productList[index]['id'],
                                  favName: productList[index]['name'],
                                  favPrice: productList[index]['price'],
                                  favPrevious_price: productList[index]
                                      ['previous_price'],
                                  favIsNew: productList[index]['isNew'],
                                ),
                                cartItem: CartItem(
                                  id: productList[index]['id'],
                                  name: productList[index]['name'],
                                  price: productList[index]['price'],
                                  previous_price: productList[index]
                                      ['previous_price'],
                                  isNew: productList[index]['isNew'],
                                ),
                                index: index,
                              );
                            },
                          ),
                        )
                      : ProductCardBanner(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
