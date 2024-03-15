import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/presentation/Screens/search/component/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SearchField(),
        ],
      ),
    );
  }
}
