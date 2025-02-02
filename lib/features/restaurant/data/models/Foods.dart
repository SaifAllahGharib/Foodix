class Foods {
  String? name;
  String? desc;
  double? price;
  String? image;

  Foods({
    this.name,
    this.desc,
    this.price,
    this.image,
  });

  Foods.fromJson(dynamic json) {
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['desc'] = desc;
    map['price'] = price;
    map['image'] = image;
    return map;
  }
}
