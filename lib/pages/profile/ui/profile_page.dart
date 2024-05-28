import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/profile/widgets/profile_image_container.dart';
import 'package:kwasi/pages/profile/widgets/setting_list.dart';

import '../widgets/profile_app_bar.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          ProfileAppBar(),
          SizedBox(
            height: 38,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ProfileImageDes(),
          ),
          SizedBox(
            height: 20,
          ),
          SettingList()
        ],
      ),
    );
  }
}
