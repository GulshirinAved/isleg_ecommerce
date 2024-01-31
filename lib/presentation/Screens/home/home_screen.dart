import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/banner.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/category_card.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/newProducts.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/salesProduct.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryCardScrolling(
              isNavigate: true,
            ),
            ImageSlider(),
            SaleProducts(),
            NewProducts(),
          ],
        ),
      ),
    );
  }
}
