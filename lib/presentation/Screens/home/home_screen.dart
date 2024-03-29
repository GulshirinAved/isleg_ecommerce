import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/banner.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/categoryScroll_card.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/saleProducts.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/newProduct.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        number: 1,
      ),
      body: const SingleChildScrollView(
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
