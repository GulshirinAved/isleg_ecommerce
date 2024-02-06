import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/carts/paymentSelection/payment_selection_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class Payment extends StatelessWidget {
  const Payment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Töleg şekili',
          style: TextStyle(
            color: AppColors.darkGreyColor1,
            fontSize: AppFonts().fontSize17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: payment.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BlocBuilder<PaymentSelectionBloc, PaymentSelectionState>(
              builder: (context, state) {
                return RadioListTile(
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  value: payment[index],
                  title: Text(
                    payment[index],
                    style: TextStyle(
                      fontSize: AppFonts().fontSize15.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  groupValue: state.selectedText,
                  activeColor: AppColors.darkOrangeColor,
                  onChanged: (value) {
                    context
                        .read<PaymentSelectionBloc>()
                        .add(ChangeOptionEvent(option: value));
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
