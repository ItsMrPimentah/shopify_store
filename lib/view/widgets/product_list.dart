import 'package:flutter/material.dart';
import 'package:shopify_store/models/products_model.dart';
import 'package:shopify_store/view/product_page.dart';

class ProductList extends StatelessWidget {
  const ProductList({required this.products, Key? key}) : super(key: key);
  final List<Product>? products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: products!.length,
            itemBuilder: ((context, index) => Card(
                  elevation: 0,
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(product: products![index]),
                      ),
                    ),
                    leading: Hero(
                      tag: "image${products![index].id}",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          products![index].image!.src!,
                        ),
                      ),
                    ),
                    title: Text(
                      products![index].title!.toString(),
                    ),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
