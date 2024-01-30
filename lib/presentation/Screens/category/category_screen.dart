import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
    );
  }
}
