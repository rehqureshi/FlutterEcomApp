import 'package:flutter/material.dart';
import 'package:project3/cartpage2.dart';
import 'package:project3/navpage_no_1.dart';
// import 'package:project3/global_variable.dart';
// import 'package:project3/product_cart.dart';
// import 'package:project3/product_detailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [NavpageNo1(), Cartpage2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 41, 65, 1),
      body:
          // pages[currentPage],
          IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        selectedFontSize: 0,
        unselectedFontSize: 0,
        unselectedIconTheme:
            const IconThemeData(color: Color.fromRGBO(181, 151, 42, 0.676)),
        selectedIconTheme: const IconThemeData(color: Colors.amberAccent),
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_checkout_sharp,
                size: 32,
              ),
              label: ''),
        ],
        elevation: 5,
        backgroundColor: Colors.black12,
      ),
    );
  }
}
