import 'package:flutter/material.dart';
import 'package:social_media_app/pages/settings/components/settings_content.dart';
import 'package:social_media_app/shared/components/my_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SettingsContent(),
    );
  }
}
