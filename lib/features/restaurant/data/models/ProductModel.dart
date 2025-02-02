import 'Foods.dart';

class ProductModel {
  String? category;
  List<Foods>? foods;

  ProductModel({
    this.category,
    this.foods,
  });

  ProductModel.fromJson(dynamic json) {
    category = json['category'];
    if (json['foods'] != null) {
      foods = [];
      json['foods'].forEach((v) {
        foods?.add(Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    if (foods != null) {
      map['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
