class Image {
  Image({
    this.id,
    this.productId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.alt,
    this.width,
    this.height,
    this.src,
    this.variantIds,
    this.adminGraphqlApiId,
  });

  final int? id;
  final int? productId;
  final int? position;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic? alt;
  final int? width;
  final int? height;
  final String? src;
  final List<dynamic>? variantIds;
  final String? adminGraphqlApiId;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        position: json["position"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        alt: json["alt"],
        width: json["width"],
        height: json["height"],
        src: json["src"],
        variantIds: json["variant_ids"] == null
            ? null
            : List<dynamic>.from(json["variant_ids"].map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "position": position,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "alt": alt,
        "width": width,
        "height": height,
        "src": src,
        "variant_ids": variantIds == null
            ? null
            : List<dynamic>.from(variantIds!.map((x) => x)),
        "admin_graphql_api_id": adminGraphqlApiId,
      };
}
