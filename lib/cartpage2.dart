import 'package:flutter/material.dart';
import 'package:project3/cart_provider.dart';

import 'package:provider/provider.dart';

class Cartpage2 extends StatelessWidget {
  const Cartpage2({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        backgroundColor: const Color.fromRGBO(5, 41, 65, 1),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  foregroundColor: Colors.black12,
                  backgroundColor: Colors.black38,
                  backgroundImage: AssetImage(cartItem['Imageurl'].toString()),
                  radius: 32,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            title: const Center(
                              child: Text(
                                'Remove Item',
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 24),
                              ),
                            ),
                            content: Text(
                              "Are You Sure Remove ${cartItem['title']} from Cart ?",
                              style: const TextStyle(
                                  color: Color.fromRGBO(181, 151, 42, .9),
                                  fontSize: 15),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        color: Color.fromRGBO(181, 151, 42, 1)),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeProduct(cartItem);
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.amber),
                                  ))
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.amberAccent,
                  ),
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: const TextStyle(
                      color: Color.fromRGBO(181, 151, 42, 0.799), fontSize: 25),
                ),
                subtitle: Text(
                  cartItem['Sizes'].toString(),
                  style: const TextStyle(
                      color: Color.fromRGBO(181, 151, 42, .6), fontSize: 21),
                ),
              );
            }));
  }
}
