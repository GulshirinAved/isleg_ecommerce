import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/product_card.dart';

class ProductCardBanner extends StatelessWidget {
  final int index;
  const ProductCardBanner({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Banner(
        message: 'Täze Haryt',
        color: AppColors.greyBlueColor,
        location: BannerLocation.topStart,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        child: productList[index]['isNew'] == true
            ? ProductCard(
                favList: productList,
                index: index,
                favItem: FavItem(
                  id: productList[index]['id'],
                  name: productList[index]['name'] ?? '',
                  price: productList[index]['price'] ?? '',
                  previous_price: productList[index]['previous_price'] ?? '',
                  isNew: productList[index]['isNew'] ?? false,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
