import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/homeCategory_bloc/home_category_bloc.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/product_card.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/topTitle.dart';

class ActionProducts extends StatefulWidget {
  const ActionProducts({super.key});

  @override
  State<ActionProducts> createState() => _ActionProductsState();
}

class _ActionProductsState extends State<ActionProducts> {
  final HomeCategoryBloc _homeCategoryBloc = HomeCategoryBloc();
  @override
  void initState() {
    super.initState();
    _homeCategoryBloc.add(GetHomeCategoryList());
  }

  @override
  void dispose() {
    super.dispose();
    _homeCategoryBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCategoryBloc,
      child: BlocBuilder<HomeCategoryBloc, HomeCategoryState>(
        builder: (context, state) {
          if (state is HomeCategoryError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is HomeCategoryInitial) {
            const Center(
              child: Text('It is initial'),
            );
          } else if (state is HomeCategoryLoading) {
            return const Center(
              child: Text('It is loading'),
            );
          } else if (state is HomeCategoryLoaded) {
            List salesProducts = state.homeCategoryList[1].products;
            return Column(
              children: [
                TopTitle(title: state.homeCategoryList[1].name),
                Container(
                  alignment: Alignment.topLeft,
                  height: 250,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        index: index,
                        favItem: FavItem(
                          favId: salesProducts[index].id,
                          favName: salesProducts[index]
                              .translations[0]
                              .ru
                              .name
                              .toString(),
                          favPrice: salesProducts[index].price.toString(),
                          favPrevious_price: 'previous price',
                          image: salesProducts[index].mainImage,
                        ),
                        cartItem: CartItem(
                          id: salesProducts[index].id,
                          name: salesProducts[index]
                              .translations[0]
                              .ru
                              .name
                              .toString(),
                          price: 'previous price',
                          previous_price: salesProducts[index].id,
                          image: salesProducts[index].mainImage,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
