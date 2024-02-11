import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/categery_selection_state.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      appBar: CustomAppbar(
        number: 3,
      ),
      body: Row(
        children: [
          SizedBox(
            width: 150,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<CategorySelectionBloc>()
                        .add(PressBoxEvent(index: index));
                    pageController.jumpToPage(index);
                  },
                  child: Row(
                    children: [
                      BlocBuilder<CategorySelectionBloc,
                          CategorySelectionState>(
                        builder: (context, state) {
                          return AnimatedContainer(
                            margin: const EdgeInsets.all(0.5),
                            duration: const Duration(milliseconds: 250),
                            height: state.stateIndex == index ? 50 : 0,
                            color: AppColors.darkOrangeColor,
                            width: 4.w,
                          );
                        },
                      ),
                      Expanded(
                        child: BlocBuilder<CategorySelectionBloc,
                            CategorySelectionState>(
                          builder: (context, state) {
                            return AnimatedContainer(
                              alignment: Alignment.center,
                              duration: const Duration(milliseconds: 250),
                              color: state.stateIndex == index
                                  ? AppColors.darkOrangeColor.withOpacity(0.2)
                                  : AppColors.transparentColor,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 5,
                                ),
                                child: Text(
                                  categoryNames[index]['name'].toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: categoryNames.length,
            ),
          ),
          Container(
            color: AppColors.lightGreyColor1,
            width: 0.5,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                context
                    .read<CategorySelectionBloc>()
                    .add(PressBoxEvent(index: value));
              },
              children: [
                for (int i = 0; i < categoryNames.length; i++)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          'categoryProduct',
                        );
                      },
                      child: BlocBuilder<CategorySelectionBloc,
                          CategorySelectionState>(
                        builder: (context, state) {
                          return Text('page ${state.stateIndex}');
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
