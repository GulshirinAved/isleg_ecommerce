import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryCardScrolling(
              isNavigate: false,
            ),
          ],
        ),
      ),
    );
  }
}
