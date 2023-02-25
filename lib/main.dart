import 'package:flutter/material.dart';
import 'package:routine_app/pages/home_page.dart';
import 'package:routine_app/pages/routine_page.dart';
import 'package:routine_app/routes/my_routes.dart';
import 'package:routine_app/themes/my_themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: MyRoutes.homePage,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.routinePage: (context) => const RoutinePage()
      },
    );
  }
}
