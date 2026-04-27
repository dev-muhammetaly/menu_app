import 'package:flutter/material.dart';
import 'package:menuu/Pages/mainpage.dart';
import 'package:menuu/core/colors.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Menu App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              side: WidgetStateProperty.all(
                BorderSide(color: AllColors.systemcolor),
              ),
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
          ),
        ),

        home: MenuPage(),
      ),
    );
  }
}
