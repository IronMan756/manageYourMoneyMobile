class CategoryModel {
  CategoryModel({
    this.img,
    this.name,
    this.description,
  });
  final String img;
  final String name;
  final String description;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'img': img,
      'name': name,
      'description': description
    };
  }

  // ignore: sort_constructors_first
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      img: json['img'].toString(),
      name: json['name'].toString(),
      description: json['description'].toString(),
    );
  }

  // ignore: prefer_constructors_over_static_methods
  static CategoryModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return CategoryModel(
        img: map['img'].toString(),
        name: map['name'].toString(),
        description: map['description'].toString());
  }
}
