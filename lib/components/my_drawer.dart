import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/drawer_title.dart';
import 'package:chatapp/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();

    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              DrawerTitle(
                title: "H O M E",
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),
              DrawerTitle(
                  title: "S E T T I N G S",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  }),
              const Spacer(),
              DrawerTitle(
                title: "L O G O U T",
                icon: Icons.logout,
                onTap: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
