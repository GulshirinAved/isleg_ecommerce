import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/blocs/bottomNavBar/bottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:isleg_ecommerce/blocs/carts/agree/agree_bloc.dart';
import 'package:isleg_ecommerce/blocs/carts/cart/cart_bloc.dart';
import 'package:isleg_ecommerce/blocs/carts/deliverySelection/delivery_selection_bloc.dart';
import 'package:isleg_ecommerce/blocs/carts/paymentSelection/payment_selection_bloc.dart';
import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/blocs/signup/passwordObscure/password_obscure_bloc.dart';
import 'package:isleg_ecommerce/blocs/signup/signin_agree/signin_agree_bloc.dart';
import 'package:isleg_ecommerce/presentation/Screens/bottomNavBar/bottomNavBar_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/cart_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/cart/checkUp_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/category_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/favorite/favorite_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/home_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/profile/profile_screen.dart';
import 'package:isleg_ecommerce/presentation/Screens/signUp/signup_screen.dart';

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
              BlocProvider(
                create: (context) => CartBloc(),
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
                    child: const HomeScreen(),
                  ),
                  BlocProvider.value(
                    value: context.read<FavButtonBloc>(),
                    child: const FavoriteScreen(),
                  ),
                ],
                child: const HomeScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'category',
                name: 'category',
                builder: (context, state) {
                  return BlocProvider<CategorySelectionBloc>.value(
                    value: context.read<CategorySelectionBloc>(),
                    child: const CategoryScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/favorite',
            name: 'favorite',
            builder: (context, state) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<FavButtonBloc>(),
                  ),
                  BlocProvider.value(
                    value: context.read<CartBloc>(),
                    child: const CartScreen(),
                  ),
                ],
                child: const FavoriteScreen(),
              );
            },
          ),
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) {
              return BlocProvider.value(
                value: context.read<CartBloc>(),
                child: const CartScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'cartCheckUp',
                name: 'cartCheckUp',
                builder: (context, state) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => PaymentSelectionBloc(),
                      ),
                      BlocProvider(
                        create: (context) => DeliverySelectionBloc(),
                      ),
                      BlocProvider(
                        create: (context) => AgreeBloc(),
                      ),
                      BlocProvider(
                        create: (context) => PasswordObscureBloc(),
                      ),
                    ],
                    child: CheckUpScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) {
              return const ProfileScreen();
            },
            routes: [
              GoRoute(
                path: 'signup',
                name: 'signup',
                builder: (context, state) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => PasswordObscureBloc(),
                    ),
                    BlocProvider(
                      create: (context) => SigninAgreeBloc(),
                    ),
                  ],
                  child: const SignUpScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
