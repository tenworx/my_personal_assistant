import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Notifications().InitialiseNotifications();
    // Notifications().sendNotification(
    //     'My Assistant App', 'Time to update your goals and routine');
    String? email;
    // Get.updateLocale(Locale('en', 'US'));
    // Get.updateLocale(Locale('fr', 'FR'));
    langPrefs().then((value) {
      value == 'French'
          ? Get.updateLocale(Locale('fr', 'FR'))
          : Get.updateLocale(Locale('en', 'US'));
      print("heyeyyeyeyeyeyeyeye $value");
    });
    initprefs().then((val) {
      Timer(const Duration(seconds: 3), () async {});
    });
  }

  Future initprefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future langPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('language');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2D3A3),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF2D3A3), Color(0xFFC08D65)],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/3509904-01.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: 1,
              bottom: 1,
              left: 1,
              right: 1,
              child: Container(
                  child: Image(
                image: AssetImage('assets/app_launcher_icon.png'),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
