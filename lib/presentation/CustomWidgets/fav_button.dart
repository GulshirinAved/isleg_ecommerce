// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class FavButton extends StatelessWidget {
  final int id;
  const FavButton({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavButtonBloc, FavButtonState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<FavButtonBloc>().add(PressedEvent(id: id));
          },
          icon: Icon(
            state.favList.contains(id) ? Icons.favorite : Icons.favorite_border,
            color: AppColors.darkOrangeColor,
            size: 26.h,
          ),
        );
      },
    );
  }
}
