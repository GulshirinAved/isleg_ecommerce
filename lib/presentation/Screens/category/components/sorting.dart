import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:isleg_ecommerce/app_localization.dart';

import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/radio_button.dart';

import '../../../../blocs/showAllProducts/sort_bloc/sort_bloc.dart';

class Sorting extends StatefulWidget {
  final String id;
  final String name;

  const Sorting({
    required this.id,
    required this.name,
    super.key,
  });

  @override
  State<Sorting> createState() => _SortingState();
}

class _SortingState extends State<Sorting> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortBloc, SortState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            openAnimatedDialog(context);
          },
          child: sortTitle(context),
        );
      },
    );
  }

  void openAnimatedDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (contextt) {
        return BlocProvider.value(
          value: BlocProvider.of<SortBloc>(context),
          child: Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: AppBorderRadius().borderRadius5,
            ),
            insetAnimationCurve: Curves.decelerate,
            insetAnimationDuration: const Duration(microseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //Top title
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 234.w,
                      margin: EdgeInsets.only(left: 5.w),
                      child: sortTitle(context),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(contextt);
                      },
                      icon: Icon(
                        CupertinoIcons.clear_circled,
                        color: AppColors.darkOrangeColor,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.greyColor,
                ),
                //Radio button
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: AppBorderRadius().borderRadius5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: sortingTitle.map((n) {
                      return BlocBuilder<SortBloc, SortState>(
                        builder: (context, state) {
                          return RadioButtn(
                            value: n,
                            groupValue: state.title,
                            title: n,
                            onchanged: () {
                              context
                                  .read<SortBloc>()
                                  .add(SortPressEvent(pressedTitle: n));
                            },
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                //agree button
                BlocBuilder<SortBloc, SortState>(
                  builder: (context, sortState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: AppBorderRadius().borderRadius10,
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            AppColors.darkOrangeColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          context.pushReplacementNamed(
                            'categoryProduct',
                            extra: {
                              'name': widget.name,
                              'id': widget.id,
                              'asc': sortState.title == sortingTitle[0]
                                  ? 'ASC'
                                  : 'DESC',
                              'n': sortState.title
                            },
                          );
                        },
                        child: Text(
                          AppLocalization.of(context).getTransatedValues(
                                'toSort',
                              ) ??
                              '',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppFonts().fontSize18,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row sortTitle(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: SvgPicture.asset(sort),
        ),
        Text(
          AppLocalization.of(context).getTransatedValues(
                'sort',
              ) ??
              '',
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontWeight: FontWeight.bold,
            fontSize: AppFonts().fontSize13,
          ),
        ),
      ],
    );
  }
}
