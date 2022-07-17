import 'package:flutter/material.dart';
import 'package:shopify_store/models/products_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Hero(
              tag: "image${product.id}",
              child: CircleAvatar(
                backgroundColor: Colors.white,
                minRadius: 200,
                maxRadius: 300,
                backgroundImage: NetworkImage(product.image!.src!),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: Text(
                      product.title!.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Prices: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        children: product.variants!
                            .map(((e) => Text(
                                  "\$${e.price!.toString()}   ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.green,
                                  ),
                                )))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Colors: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        spacing: 15,
                        children: product.variants!
                            .map(((e) => Text(
                                  e.option1!.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                )))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quantity: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        spacing: 15,
                        children: product.variants!
                            .map(((e) => Text(
                                  e.inventoryQuantity!.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                )))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
