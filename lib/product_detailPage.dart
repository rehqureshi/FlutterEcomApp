// ignore: file_names
// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:project3/cart_provider.dart';
// import 'package:project3/global_variable.dart';
import 'package:provider/provider.dart';
// import 'package:project3/global_variable.dart';

class ProductDetailpage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailpage({super.key, required this.product});

  @override
  State<ProductDetailpage> createState() => _ProductDetailpageState();
}

class _ProductDetailpageState extends State<ProductDetailpage> {
  late String selectedtype;

  void onTap() {
    Provider.of<CartProvider>(context, listen: false).addProduct(
      {
        'title': widget.product['title'],
        'price': widget.product['price'],
        'Sizes': selectedtype,
        'Imageurl': widget.product['Imageurl'],
      },
    );
    // with .of with provider we are only allowed to listen the value of provider but here we want to do update the velues
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        '${widget.product['title']} Of Size $selectedtype is Added To Cart Successfully',
        style: const TextStyle(
            color: Color.fromRGBO(
              181,
              151,
              42,
              0.976,
            ),
            fontSize: 18),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    selectedtype = (widget.product['Sizes'] as List<String>)[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(5, 41, 65, 1),
        appBar: AppBar(
          title: const Text('Details'),
          actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(181, 151, 42, 0.976),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 7,
              ),
              Text(
                widget.product['title'] as String,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Center(
                child: Image.asset(
                  widget.product['Imageurl']! as String,
                  height: 450,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                height: 235,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(1, 28, 44, 1),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '₹${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (widget.product['Sizes'] as List<String>).length,
                          itemBuilder: (context, index) {
                            final type = (widget.product['Sizes']
                                as List<String>)[index];
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 9),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedtype = type;
                                    });
                                  },
                                  child: Chip(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: selectedtype == type
                                                ? Colors.black
                                                : Colors.amberAccent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: selectedtype == type
                                        ? const Color.fromRGBO(
                                            181, 151, 42, 0.976)
                                        : Colors.black,
                                    label: Text(type.toString()),
                                    labelStyle: TextStyle(
                                        color: selectedtype == type
                                            ? Colors.black
                                            : const Color.fromRGBO(
                                                181, 151, 42, 0.976)),
                                    padding: const EdgeInsets.all(10),
                                  ),
                                ));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Color.fromRGBO(181, 151, 42, 0.976),
                        ),
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(double.maxFinite, 50)),
                        label: const Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: Color.fromRGBO(181, 151, 42, 0.976),
                              fontSize: 25),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
