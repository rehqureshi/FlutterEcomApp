import 'package:flutter/material.dart';

import 'package:project3/global_variable.dart';
import 'package:project3/product_cart.dart';
import 'package:project3/product_detailPage.dart';

class NavpageNo1 extends StatefulWidget {
  const NavpageNo1({super.key});

  @override
  State<NavpageNo1> createState() => _NavpageNo1State();
}

class _NavpageNo1State extends State<NavpageNo1> {
  final List<String> filters = [
    'Home Page',
    products[0]['title'] as String,
    products[1]['title'] as String,
    products[2]['title'] as String,
  ];
  late String selectaFilter;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectaFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "COLLECTION",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  style: TextStyle(color: Color.fromRGBO(181, 151, 42, 0.976)),
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                          color: Colors.black38),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(32))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(32))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(32))),
                      focusColor: Colors.amber),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectaFilter = filter;
                      });
                      if (index == 0 || index == 1) {
                        _scrollController.animateTo(
                            _scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.ease);
                      }

                      if (index == 2) {
                        if (_scrollController.offset ==
                            _scrollController.position.maxScrollExtent) {
                          _scrollController.animateTo(
                              _scrollController.offset - 550,
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.ease);
                        } else if (_scrollController.offset ==
                            _scrollController.position.minScrollExtent) {
                          _scrollController.animateTo(
                              _scrollController.offset + 550,
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.ease);
                        }
                      }

                      if (index == 3) {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.ease);
                      }
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: selectaFilter == filter
                                  ? Colors.black
                                  : Colors.amberAccent),
                          borderRadius: BorderRadius.circular(32)),
                      backgroundColor: selectaFilter == filter
                          ? const Color.fromRGBO(181, 151, 42, 0.976)
                          : Colors.black,
                      label: Text(filter),
                      labelStyle: TextStyle(
                          color: selectaFilter == filter
                              ? Colors.black
                              : const Color.fromRGBO(181, 151, 42, 0.976)),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: size.width > 950
                ? GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 2,
                            crossAxisCount: 2,
                            childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (contex) {
                            return ProductDetailpage(product: product);
                          }));
                        },
                        child: ProductCart(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['Imageurl'] as String,
                          backgroundColor:
                              index.isEven ? Colors.black38 : Colors.black12,
                        ),
                      );
                    })
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (contex) {
                            return ProductDetailpage(product: product);
                          }));
                        },
                        child: ProductCart(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['Imageurl'] as String,
                          backgroundColor:
                              index.isEven ? Colors.black38 : Colors.black12,
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
