import 'package:benders_shared_prefs/src/constants/keys.dart';
import 'package:benders_shared_prefs/src/features/home_screen.dart';
import 'package:benders_shared_prefs/src/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  bool isLoading = false;

  @override
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    ageController = TextEditingController();
  }

  _changeLoadState() {
    isLoading = true;
    setState(() {});

    Future.delayed(const Duration(milliseconds: 500), () {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                  height: 16), // Add some spacing between the text fields
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),

                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _changeLoadState();
                  UserSharedPreferences.setUserName(
                      LocalKeys.userName, nameController.text);
                  UserSharedPreferences.setUserAge(
                      LocalKeys.userAge, ageController.text);
                  UserSharedPreferences.setBool(LocalKeys.isUserLoggedIn, true);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
