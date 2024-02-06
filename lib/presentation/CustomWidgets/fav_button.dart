// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';

class FavButton extends StatelessWidget {
  final FavItem favItem;
  const FavButton({
    Key? key,
    required this.favItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavButtonBloc, FavButtonState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (state.favList.contains(favItem) == false) {
              context.read<FavButtonBloc>().add(AddFavEvent(item: favItem));
            } else {
              context.read<FavButtonBloc>().add(RemoveFavEvent(item: favItem));
            }
          },
          icon: Icon(
            state.favList.contains(favItem)
                ? Icons.favorite
                : Icons.favorite_border,
            color: AppColors.darkOrangeColor,
            size: 26.h,
          ),
        );
      },
    );
  }
}
