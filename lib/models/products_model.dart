import 'dart:collection';

import 'image_model.dart';
import 'option_model.dart';
import 'variant_model.dart';

class Products {
  Products({
    this.products,
  });

  List<Product>? products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
      products: json["products"] != null
          ? List<Product>.from(json["products"].map((x) => Product.fromJson(x)))
          : null);

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product(
      {this.id,
      this.title,
      this.bodyHtml,
      this.vendor,
      this.productType,
      this.createdAt,
      this.handle,
      this.updatedAt,
      this.publishedAt,
      this.templateSuffix,
      this.status,
      this.publishedScope,
      this.tags,
      this.adminGraphqlApiId,
      this.variants,
      this.options,
      this.images,
      this.image,
      this.tagsList});

  final int? id;
  final String? title;
  final String? bodyHtml;
  final String? vendor;
  final String? productType;
  final DateTime? createdAt;
  final String? handle;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic? templateSuffix;
  final Status? status;
  final PublishedScope? publishedScope;
  final String? tags;
  final String? adminGraphqlApiId;
  final List<Variant>? variants;
  final List<Option>? options;
  final List<Image>? images;
  final Image? image;
  final List<String>? tagsList;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        bodyHtml: json["body_html"],
        vendor: json["vendor"],
        productType: json["product_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        handle: json["handle"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        templateSuffix: json["template_suffix"],
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        publishedScope: json["published_scope"] == null
            ? null
            : publishedScopeValues.map![json["published_scope"]],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        variants: json["variants"] == null
            ? null
            : List<Variant>.from(
                json["variants"].map((x) => Variant.fromJson(x))),
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        tagsList: json["tags"] == null
            ? null
            : LinkedHashSet<String>.from(json["tags"].split(","))
                .toSet()
                .toList(),
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body_html": bodyHtml,
        "vendor": vendor,
        "product_type": productType,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "handle": handle,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "published_at":
            publishedAt == null ? null : publishedAt!.toIso8601String(),
        "template_suffix": templateSuffix,
        "status": status == null ? null : statusValues.reverse[status],
        "published_scope": publishedScope == null
            ? null
            : publishedScopeValues.reverse[publishedScope],
        "tags": tags,
        "admin_graphql_api_id": adminGraphqlApiId,
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "image": image == null ? null : image!.toJson(),
      };
}

enum Name { TITLE }

enum PublishedScope { WEB }

enum Status { ACTIVE }

enum FulfillmentService { MANUAL }

enum InventoryPolicy { DENY }

enum WeightUnit { KG }

final nameValues = EnumValues({"Title": Name.TITLE});

final publishedScopeValues = EnumValues({"web": PublishedScope.WEB});

final statusValues = EnumValues({"active": Status.ACTIVE});
final fulfillmentServiceValues =
    EnumValues({"manual": FulfillmentService.MANUAL});
final inventoryPolicyValues = EnumValues({"deny": InventoryPolicy.DENY});

final weightUnitValues = EnumValues({"kg": WeightUnit.KG});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
