import 'package:shopify_store/models/products_model.dart';

class Variant {
  Variant({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.sku,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.fulfillmentService,
    this.inventoryManagement,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.grams,
    this.imageId,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.requiresShipping,
    this.adminGraphqlApiId,
  });

  int? id;
  final int? productId;
  final String? title;
  final String? price;
  final String? sku;
  final int? position;
  final InventoryPolicy? inventoryPolicy;
  final dynamic? compareAtPrice;
  final FulfillmentService? fulfillmentService;
  final dynamic? inventoryManagement;
  final String? option1;
  final dynamic? option2;
  final dynamic? option3;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? taxable;
  final dynamic? barcode;
  final int? grams;
  final dynamic? imageId;
  final double? weight;
  final WeightUnit? weightUnit;
  final int? inventoryItemId;
  final int? inventoryQuantity;
  final int? oldInventoryQuantity;
  final bool? requiresShipping;
  final String? adminGraphqlApiId;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        price: json["price"],
        sku: json["sku"],
        position: json["position"],
        inventoryPolicy: json["inventory_policy"] == null
            ? null
            : inventoryPolicyValues.map![json["inventory_policy"]],
        compareAtPrice: json["compare_at_price"],
        fulfillmentService: json["fulfillment_service"] == null
            ? null
            : fulfillmentServiceValues.map![json["fulfillment_service"]],
        inventoryManagement: json["inventory_management"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        taxable: json["taxable"],
        barcode: json["barcode"],
        grams: json["grams"],
        imageId: json["image_id"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        weightUnit: json["weight_unit"] == null
            ? null
            : weightUnitValues.map![json["weight_unit"]],
        inventoryItemId: json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"],
        requiresShipping: json["requires_shipping"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "title": title,
        "price": price,
        "sku": sku,
        "position": position,
        "inventory_policy": inventoryPolicy == null
            ? null
            : inventoryPolicyValues.reverse[inventoryPolicy],
        "compare_at_price": compareAtPrice,
        "fulfillment_service": fulfillmentService == null
            ? null
            : fulfillmentServiceValues.reverse[fulfillmentService],
        "inventory_management": inventoryManagement,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "taxable": taxable,
        "barcode": barcode,
        "grams": grams,
        "image_id": imageId,
        "weight": weight,
        "weight_unit":
            weightUnit == null ? null : weightUnitValues.reverse[weightUnit],
        "inventory_item_id": inventoryItemId,
        "inventory_quantity": inventoryQuantity,
        "old_inventory_quantity": oldInventoryQuantity,
        "requires_shipping": requiresShipping,
        "admin_graphql_api_id": adminGraphqlApiId,
      };
}
