import 'package:flutter/material.dart';
import 'package:shopify_store/domain/services.dart';
import 'package:shopify_store/models/products_model.dart';
import 'package:shopify_store/view/product_list_page.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  List<Product> _products = [];
  List<String> tags = [];
  List<String> orderedTags = [];
  List<Product> filteredProducts = [];

  @override
  void initState() {
    ApiRequest().get().then(
      (value) {
        setState(() {
          _products = value;
          for (var element in _products) {
            for (var tag in element.tagsList!) {
              tags.add(tag.trim());
              orderedTags = tags.toSet().toList();
              filteredProducts = _products
                  .where(
                    (element) => element.tags!.contains(
                      tags.first.trim(),
                    ),
                  )
                  .toList();
            }
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Tags",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: tags.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: DefaultTabController(
                  animationDuration: const Duration(milliseconds: 200),
                  length: tags.toSet().length,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Colors.white,
                          labelColor: Colors.white,
                          padding: const EdgeInsets.all(6),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          isScrollable: true,
                          onTap: (index) {
                            setState(() {
                              filteredProducts = _products
                                  .where((element) => element.tags!
                                      .contains(orderedTags[index].trim()))
                                  .toList();
                            });
                          },
                          tabs: orderedTags
                              .map(
                                (e) => Tab(
                                  text: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: ProductList(products: filteredProducts),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
