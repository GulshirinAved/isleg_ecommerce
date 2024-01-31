import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/productBanner_card.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/topTitle.dart';

class SaleProducts extends StatelessWidget {
  const SaleProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopTitle(title: 'Täze harytlar'),
        Container(
          alignment: Alignment.topLeft,
          height: 250,
          width: double.infinity,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductCardBanner(
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
