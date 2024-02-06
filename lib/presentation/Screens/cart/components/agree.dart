import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/blocs/carts/agree/agree_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class Agree extends StatelessWidget {
  const Agree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgreeBloc, AgreeState>(
      builder: (context, state) {
        return CheckboxListTile(
          activeColor: AppColors.darkOrangeColor,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            'Şahsy maglumatlaryň gaýtadan işlemegi hakda habarly bolmagym üçin telefona iberilmegini kabul edýärin.',
            style: TextStyle(
              fontSize: AppFonts().fontSize15,
              color: AppColors.greyColor,
            ),
          ),
          value: state.value,
          onChanged: (value) {
            context.read<AgreeBloc>().add(ChangeAgreeEvent(value: value!));
          },
        );
      },
    );
  }
}
