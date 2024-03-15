import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/blocs/category/category_bloc.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/categoryRight_side.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/category_side.dart';

class CategoryScreen extends StatefulWidget {
  final List categoryList;
  const CategoryScreen({
    required this.categoryList,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late PageController pageController;
  final CategoryBloc _categoryBloc = CategoryBloc();

  @override
  void initState() {
    super.initState();
    _categoryBloc.add(
      CategoryInitialEvent(
        categoryList: List<bool>.filled(widget.categoryList.length, false),
      ),
    );
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _categoryBloc,
      child: Scaffold(
        appBar: CustomAppbar(
          number: 3,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorySide(
              categoryList: widget.categoryList,
              pageController: pageController,
            ),
            Container(
              color: AppColors.lightGreyColor1,
              width: 0.5,
            ),
            CategoryRight(
              categoryList: widget.categoryList,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _categoryBloc.close();
    pageController.dispose();
  }
}
