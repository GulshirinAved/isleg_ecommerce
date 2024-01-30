import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/home_screen.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    BlocProvider(
      create: (context) => CategorySelectionBloc(),
      child: HomeScreen(),
    ),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  return _widget[index];
}
