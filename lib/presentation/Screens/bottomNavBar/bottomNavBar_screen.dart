import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/blocs/bottomNavBar/bottomNavBar/bottom_nav_bar_bloc.dart';
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
              GoRouter.of(context).goNamed(indexRouteNames[value]);
            },
            unselectedItemColor: AppColors.greyColor,
            selectedItemColor: AppColors.darkOrangeColor,
            selectedLabelStyle: TextStyle(color: AppColors.darkGreyColor),
            unselectedLabelStyle: TextStyle(color: AppColors.darkGreyColor),
            items: bottomtabs,
          ),
        );
      },
    );
  }

  var bottomtabs = const [
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.home),
      label: 'Baş sahypa',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Halanlam',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.buy),
      label: 'Sebet',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.profile),
      label: 'Profil',
    ),
  ];
}
