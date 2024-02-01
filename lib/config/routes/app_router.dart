import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/blocs/bottomNavBar/bottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/presentation/Screens/bottomNavBar/bottomNavBar_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/cart_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/category_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/favorite/favorite_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/home_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/profile/profile_screen.dart';

class AppRouter {
  AppRouter._();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomNavBarBloc(),
              ),
              BlocProvider(
                create: (context) => CategorySelectionBloc(),
              ),
              BlocProvider(
                create: (context) => FavButtonBloc(),
              ),
            ],
            child: BottomNavBar(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<CategorySelectionBloc>(),
                    child: HomeScreen(),
                  ),
                  BlocProvider.value(
                    value: context.watch<FavButtonBloc>(),
                    child: FavoriteScreen(),
                  )
                ],
                child: HomeScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'category',
                name: 'category',
                builder: (context, state) {
                  return BlocProvider<CategorySelectionBloc>.value(
                    value: context.read<CategorySelectionBloc>(),
                    child: CategoryScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/favorite',
            name: 'favorite',
            builder: (context, state) {
              return BlocProvider.value(
                value: context.watch<FavButtonBloc>(),
                child: const FavoriteScreen(),
              );
            },
          ),
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) {
              return const CartScreen();
            },
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) {
              return const ProfileScreen();
            },
          ),
        ],
      ),
    ],
  );
}
