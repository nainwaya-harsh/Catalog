import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/pages/cart_page.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/utiles/routes.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/homepage.dart';
import 'pages/login_page.dart';
import 'utiles/routes.dart';
import 'pages/home_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: HomePageDetail(),
      home: LoginPage(),
      themeMode: ThemeMode.system,
      // theme: MyTheme.lightTheme(context),
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // initialRoute: "/home",
      routes: {
        //will not work because we have mention home above
        MyRoutes.loginRoute: ((context) => LoginPage()),
        MyRoutes.homeRoute: ((context) => HomePage()),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
