import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isleg_ecommerce/blocs/favButton/fav_button_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: BlocBuilder<FavButtonBloc, FavButtonState>(
        builder: (context, state) {
          if (state is FavButtonInitial || state.favList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(heart),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
                    child: Text(
                      "Halanan haryt ýok",
                      style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: AppFonts().fontSize20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Ilki halan harytlaryňyzy goşuň",
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppFonts().fontSize14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else {
            print('I am in fav button ${state.favList}');

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 215.h),
                itemCount: state.favList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ProductCard(
                      favList: state.favList,
                      index: index,
                      favItem: FavItem(
                        id: state.favList[index].id,
                        name: state.favList[index].name,
                        price: state.favList[index].price,
                        previous_price: state.favList[index].previous_price,
                        isNew: state.favList[index].isNew,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
