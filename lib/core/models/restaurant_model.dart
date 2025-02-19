import 'package:yummy_home/core/models/ProductModel.dart';

class RestaurantModel {
  final String uid;
  final String name;
  final String? desc;
  final num? rates;
  final int? countRates;
  final List<ProductModel>? categories;

  RestaurantModel({
    required this.uid,
    required this.name,
    this.desc,
    this.rates,
    this.countRates,
    this.categories,
  });

  factory RestaurantModel.fromJson(Map<dynamic, dynamic> json) =>
      RestaurantModel(
        uid: json['uid'],
        name: json['name'],
        desc: json['desc'] ?? "",
        rates: json['rates'] ?? 0,
        countRates: json['countRates'] ?? 0,
        categories: json['categories'] != null
            ? (json['categories'] as Map<dynamic, dynamic>)
                .values
                .map((item) => ProductModel.fromJson(item))
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'rates': rates ?? 0,
      'desc': desc ?? "",
      'countRates': countRates ?? 0,
      'categories': categories?.map((c) => c.toJson()).toList() ?? [],
    };
  }
}
