import 'package:flutter/material.dart';
import 'package:social_media_app/pages/auth/auth_service.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Widget body;
  final Widget? drawer;
  final bool? showLogoutAction;

  MyScaffold({
    super.key,
    this.title = '',
    this.backgroundColor,
    required this.body,
    this.drawer,
    this.showLogoutAction = false,
  });

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          title: Text(title),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Colors.grey,
          elevation: 0,
          actions: [
            showLogoutAction == true
                ? IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: authService.logout,
                  )
                : Container(),
          ]),
      drawer: drawer,
      body: body,
    );
  }
}
