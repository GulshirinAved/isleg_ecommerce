import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:isleg_ecommerce/blocs/home/category_bloc/categery_selection_state.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/getHeader_bloc/get_header_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class CategoryCardScrolling extends StatelessWidget {
  final bool isNavigate;
  const CategoryCardScrolling({
    required this.isNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetHeaderBloc()..add(GetHeaderList()),
      child: BlocBuilder<GetHeaderBloc, GetHeaderState>(
        builder: (context, state) {
          if (state is GetHeaderError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is GetHeaderInitial) {
            return const Center(
              child: Text('It is initial'),
            );
          } else if (state is GetHeaderLoading) {
            return const Center(
              child: Text('It is loading'),
            );
          } else if (state is GetHeaderLoaded) {
            if (state.getHeaderList.isEmpty) {
              return const Center(
                child: Text('No data'),
              );
            } else {
              final List category = state.getHeaderList;
              return SizedBox(
                height: 85.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<CategorySelectionBloc>()
                            .add(PressBoxEvent(index: index));
                        if (isNavigate == true) {
                          context.pushNamed(
                            'category',
                            extra: {'categoryList': state.getHeaderList},
                          );
                        }
                      },
                      child: BlocBuilder<CategorySelectionBloc,
                          CategorySelectionState>(
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
                                CachedNetworkImage(
                                  imageUrl:
                                      'http://$host/${category[index].image}',
                                  fit: BoxFit.cover,
                                  height: 34.h,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 3.h,
                                    left: 3.w,
                                    right: 3.w,
                                  ),
                                  height: 32.h,
                                  child: Text(
                                    maxLines: 2,
                                    category[index].name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: state.stateIndex == index
                                          ? AppColors.whiteColor
                                          : AppColors.greyColor,
                                      fontSize: AppFonts().fontSize13.sp,
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
