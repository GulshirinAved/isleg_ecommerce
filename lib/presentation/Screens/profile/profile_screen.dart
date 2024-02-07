import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/profile/component/personsData.dart';
import 'package:isleg_ecommerce/presentation/Screens/profile/component/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(number: 3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PersonData(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: profileTiles.length,
            itemExtent: 60,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: ProfileTile(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
