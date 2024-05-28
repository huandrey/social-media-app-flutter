import 'package:flutter/material.dart';
import 'package:social_media_app/pages/auth/auth_service.dart';
import 'package:social_media_app/pages/settings/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(
                    'H O M E',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text(
                    'P R O F I L E',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text(
                    'U S E R S',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text(
                    'A J U S T E S ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'S A I R',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => AuthService().logout(),
            ),
          ),
        ],
      ),
    );
  }
}
