// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';

class DividerLine extends StatelessWidget {
  final Color? color;
  const DividerLine(
    BuildContext context, {
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: color == null ? 1 : 0.5,
      color: color == null ? AppColors.whiteColor : AppColors.darkBlueColor,
    );
  }
}
