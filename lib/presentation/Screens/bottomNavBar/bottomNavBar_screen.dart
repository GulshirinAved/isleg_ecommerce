import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/app_localization.dart';
import 'package:isleg_ecommerce/blocs/bottomNavBar/bottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:isleg_ecommerce/blocs/carts/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  final Widget child;
  BottomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              context
                  .read<BottomNavBarBloc>()
                  .add(TriggerBottomNavBarEvent(value));
              GoRouter.of(context).pushNamed(indexRouteNames[value]);
            },
            unselectedItemColor: AppColors.greyColor,
            selectedItemColor: AppColors.darkOrangeColor,
            selectedLabelStyle: TextStyle(color: AppColors.darkGreyColor),
            unselectedLabelStyle: TextStyle(color: AppColors.darkGreyColor),
            items: bottomtabs(context),
          ),
        );
      },
    );
  }
}

List<BottomNavigationBarItem> bottomtabs(BuildContext context) {
  return [
    BottomNavigationBarItem(
      icon: const Icon(IconlyBold.home),
      label: AppLocalization.of(context).getTransatedValues('homePage') ?? '',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.favorite),
      label:
          AppLocalization.of(context).getTransatedValues('myFavorites') ?? '',
    ),
    BottomNavigationBarItem(
      icon: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.cartList.isEmpty
              ? const Icon(IconlyBold.buy)
              : Badge(
                  label: Text(state.cartList.length.toString()),
                  child: const Icon(IconlyBold.buy),
                );
        },
      ),
      label: AppLocalization.of(context).getTransatedValues('cart') ?? '',
    ),
    BottomNavigationBarItem(
      icon: const Icon(IconlyBold.profile),
      label: AppLocalization.of(context).getTransatedValues('profile') ?? '',
    ),
  ];
}
