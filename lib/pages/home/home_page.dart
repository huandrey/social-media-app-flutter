import 'package:flutter/material.dart';
import 'package:social_media_app/pages/home/components/home_content.dart';
import 'package:social_media_app/shared/components/my_drawer.dart';
import 'package:social_media_app/shared/components/my_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      drawer: const MyDrawer(),
      body: HomeContent(),
      showLogoutAction: true,
    );
  }
}
