import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/blocs/bottomNavBar/bottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:isleg_ecommerce/presentation/Screens/bottomNavBar/bottomNavBar_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'bottomNavBar',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => BottomNavBarBloc(),
          child: BottomNavBar(),
        );
      },
    ),
  ],
);
