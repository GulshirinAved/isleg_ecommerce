import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/categery_selection_state.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class CategorySide extends StatelessWidget {
  final List categoryList;
  final PageController pageController;
  const CategorySide({
    required this.categoryList,
    required this.pageController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.h,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: categoryList.length,
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
                BlocBuilder<CategorySelectionBloc, CategorySelectionState>(
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
                        decoration: BoxDecoration(
                            color: state.stateIndex == index
                                ? AppColors.darkOrangeColor.withOpacity(0.2)
                                : AppColors.transparentColor,
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.lightGreyColor1))),
                        alignment: Alignment.centerLeft,
                        duration: const Duration(milliseconds: 250),
                        height: 50,
                        child: Text(
                          categoryList[index].name.toString(),
                          textAlign: TextAlign.start,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
