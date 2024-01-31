import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:isleg_ecommerce/blocs/home/category_bloc/categery_selection_state.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class CategoryCardScrolling extends StatelessWidget {
  final bool isNavigate;
  const CategoryCardScrolling({
    super.key,
    required this.isNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context
                  .read<CategorySelectionBloc>()
                  .add(PressBoxEvent(index: index));
              if (isNavigate == true) {
                context.pushNamed('category');
              }
            },
            child: BlocBuilder<CategorySelectionBloc, CategorySelectionState>(
              builder: (context, state) {
                return Container(
                  height: 85.h,
                  width: 85.w,
                  color: state.stateIndex == index
                      ? AppColors.darkOrangeColor
                      : AppColors.whiteColor,
                  padding: const EdgeInsets.only(top: 5),
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        categoryNames[index]['icon'],
                        height: 35.h,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 6.h, left: 2.w, right: 2.w),
                        height: 23.h,
                        child: Text(
                          categoryNames[index]['name'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: state.stateIndex == index
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                            fontSize: AppFonts().fontSize15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
