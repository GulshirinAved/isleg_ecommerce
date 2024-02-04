import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: AppBorderRadius().borderRadius10,
          ),
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(MediaQuery.of(context).size.width - 20, 50),
        ),
        backgroundColor: MaterialStatePropertyAll(AppColors.darkOrangeColor),
      ),
      onPressed: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Sargyt et',
                style: TextStyle(fontSize: AppFonts().fontSize18),
              ),
            ),
            const Positioned(
              right: 0,
              top: 8,
              child: Icon(
                IconlyLight.arrowRightCircle,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
