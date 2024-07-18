import 'package:flutter/material.dart';
import 'package:project3/cart_provider.dart';
// import 'package:project3/global_variable.dart';
import 'package:project3/home_page.dart';
import 'package:provider/provider.dart';
// import 'package:project3/product_detailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provider (Read only values)
      //ChangeNotifierProvider (change the value and notify widged about the value change)
      //Future Provider (for the future values)
      //Stream provider (for stream values);

      create: (context) => CartProvider(),
      child: MaterialApp(
          title: "awara.Inc",
          theme: ThemeData(
              fontFamily: 'Trajan Pro',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
              textTheme: const TextTheme(
                  titleLarge: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                      color: Color.fromRGBO(181, 151, 42, 0.976)),
                  titleMedium: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 38,
                      color: Color.fromRGBO(181, 151, 42, 0.776)),
                  titleSmall: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Color.fromRGBO(181, 151, 42, 0.776))),
              appBarTheme: const AppBarTheme(
                color: Color.fromRGBO(1, 28, 44, 1),
                actionsIconTheme: IconThemeData(color: Colors.amber),
                titleTextStyle: TextStyle(
                    fontFamily: 'Trajan Pro',
                    color: Color.fromRGBO(181, 151, 42, 0.976),
                    fontSize: 26),
              )),
          home: const HomePage()),
    );
  }
}
