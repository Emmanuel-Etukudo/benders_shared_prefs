import 'package:benders_shared_prefs/src/features/home_screen.dart';
import 'package:benders_shared_prefs/src/features/login_screen.dart';
import 'package:benders_shared_prefs/src/providers/theme_providers.dart';
import 'package:benders_shared_prefs/src/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/constants/keys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isUserLoggedIn;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    isUserLoggedIn ??=
        await UserSharedPreferences.getBool(LocalKeys.isUserLoggedIn);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final theme = ref.watch(themeProvider);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          debugShowCheckedModeBanner: false,
          //darkTheme: AppTheme.darkTheme,
          home: isUserLoggedIn == true
              ? const HomeScreen()
              : const LoginScreen(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
