import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routine_app/pages/first_page.dart';
import 'package:routine_app/pages/days.dart';
import 'package:routine_app/pages/login_page.dart';
import 'package:routine_app/pages/routine_page.dart';
import 'package:routine_app/pages/signup_page.dart';
import 'package:routine_app/routes/my_routes.dart';
import 'package:routine_app/themes/my_themes.dart';

void main() async => {
      WidgetsFlutterBinding.ensureInitialized(),
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      ),
      runApp(MyApp()) // To turn off landscape mode
    };

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      // initialRoute: MyRoutes.firstPage,
      routes: {
        MyRoutes.firstPage: (context) => const FirstPage(),
        MyRoutes.loginPage: (context) => LoginPage(),
        MyRoutes.signUpPage: (context) => const SignUpPage(),
      },
    );
  }
}
