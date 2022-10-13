import 'package:flutter/material.dart';
import 'package:flutter2/pages/login_page.dart';
import 'package:flutter2/utils/routes.dart';
import 'package:flutter2/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bringvegitables();
    return MaterialApp(
      // home: Homepage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      theme:MyTheme.lightTheme(context),

      darkTheme: MyTheme.darkTheme(context),

      initialRoute: MyRoutes.homeRoute,

      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
      },
    );
  }

  bringvegitables({int rupess = 200}) {}
}
