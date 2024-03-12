import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          Column(
            children: [
              ProfileTile(
                index: 0,
                onTap: () {},
              ),
              ProfileTile(
                index: 1,
                onTap: () {},
              ),
              ProfileTile(
                index: 2,
                onTap: () {},
              ),
              ProfileTile(
                index: 3,
                onTap: () {},
                isLang: true,
              ),
              ProfileTile(
                index: 4,
                onTap: () {},
              ),
              ProfileTile(
                index: 5,
                onTap: () {},
              ),
              ProfileTile(
                index: 6,
                onTap: () {},
              ),
              ProfileTile(
                index: 7,
                onTap: () {
                  context.pushNamed('signup');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
