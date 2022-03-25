import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:idea_usher_health_app/src/binding/home_binding.dart';
import 'package:idea_usher_health_app/src/screens/home/home.dart';
import 'package:idea_usher_health_app/src/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Title',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.route,
      getPages: [
        GetPage(
          name: Splash.route,
          page: () => const Splash(),
        ),
        GetPage(
          name: Home.route,
          page: () => const Home(),
          binding: HomeBinding(),
          transition: Transition.cupertino,
        ),
      ],
    );
  }
}
