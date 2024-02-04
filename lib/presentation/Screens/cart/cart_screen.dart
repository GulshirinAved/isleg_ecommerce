import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/empty_warn.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/cart_card.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/components/order_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        number: 2,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial || state.cartList.isEmpty) {
            return EmptyWarn(
              icon: cart,
              topTitle: 'Sebediňiz boş',
              desc: 'Sargyt etmek üçin sebede haryt goşuň',
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.cartList.length,
            itemBuilder: (context, index) {
              return CartCard(
                cartItem: CartItem(
                  id: state.cartList[index].id,
                  name: state.cartList[index].name,
                  price: state.cartList[index].price,
                  previous_price: state.cartList[index].previous_price,
                  isNew: state.cartList[index].isNew,
                ),
                index: index,
              );
            },
          );
        },
      ),
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.cartList.isEmpty
              ? const SizedBox.shrink()
              : const OrderButton();
        },
      ),
    );
  }
}
