import 'package:benders_shared_prefs/src/constants/keys.dart';
import 'package:benders_shared_prefs/src/providers/theme_providers.dart';
import 'package:benders_shared_prefs/src/utils/app_theme.dart';
import 'package:benders_shared_prefs/src/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isLightMode;
  String? name;
  String? age;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    name ??= await UserSharedPreferences.getUserName(LocalKeys.userName);

    age ??= await UserSharedPreferences.getUserAge(LocalKeys.userAge);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final themeValue = ref.watch(themeProvider);
              final themeProviderDate = ref.watch(themeProvider.notifier);
              return IconButton(
                onPressed: () {
                  themeProviderDate.toggleTheme();
                },
                icon: themeValue == AppTheme.lightTheme
                    ? const Icon(Icons.wb_sunny)
                    : const Icon(Icons.nights_stay),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My name is $name and my age is $age"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                UserSharedPreferences.clearPrefs();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen(
                            title: 'Flutter Demo Home Page',
                          )),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout_sharp),
              label: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
