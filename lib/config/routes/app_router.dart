import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/home_screen.dart';

final GoRouter router = GoRouter(debugLogDiagnostics: true, routes: <GoRoute>[
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) {
      return BlocProvider(
        create: (context) => CategorySelectionBloc(),
        child: HomeScreen(),
      );
    },
  ),
]);
