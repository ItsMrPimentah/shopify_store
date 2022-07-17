import 'products_model.dart';

class Option {
  Option({
    this.id,
    this.productId,
    this.name,
    this.position,
    this.values,
  });

  final int? id;
  final int? productId;
  final Name? name;
  final int? position;
  final List<String>? values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"] == null ? null : nameValues.map![json["name"]],
        position: json["position"],
        values: json["values"] == null
            ? null
            : List<String>.from(json["values"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name == null ? null : nameValues.reverse[name],
        "position": position,
        "values":
            values == null ? null : List<dynamic>.from(values!.map((x) => x)),
      };
}
