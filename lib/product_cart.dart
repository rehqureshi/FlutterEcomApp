import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCart(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 7,
            ),
            Text(
              '$price Rs',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 7,
            ),
            // Image(
            //   image: AssetImage(image),
            //   height: 350,
            // ),
            Center(
              child: Image.asset(
                image,
                height: 350,
              ),
            )
          ],
        ),
      ),
    );
  }
}
