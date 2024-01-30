import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:isleg_ecommerce/blocs/bottomNavBar/bottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/Screens/bottomNavBar/components/buildPage.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              context
                  .read<BottomNavBarBloc>()
                  .add(TriggerBottomNavBarEvent(value));
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
