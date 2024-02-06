import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/carts/deliverySelection/delivery_selection_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Eltip berme wagtyny saylaň',
          style: TextStyle(
            color: AppColors.darkGreyColor1,
            fontSize: AppFonts().fontSize17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Ertir (03.05.2022)',
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: AppFonts().fontSize17.sp,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: deliveryTime.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BlocBuilder<DeliverySelectionBloc, DeliverySelectionState>(
              builder: (context, state) {
                return RadioListTile(
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  value: deliveryTime[index],
                  title: Text(
                    deliveryTime[index],
                    style: TextStyle(
                      fontSize: AppFonts().fontSize15.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  groupValue: state.selectedText,
                  onChanged: (value) {
                    context
                        .read<DeliverySelectionBloc>()
                        .add(ChangeOptionDeliveryEvent(text: value));
                  },
                  activeColor: AppColors.darkOrangeColor,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
