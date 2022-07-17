import 'package:flutter/material.dart';
import 'package:shopify_store/models/products_model.dart';
import 'package:shopify_store/view/widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Product Details",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ProductCard(product: product!));
  }
}
