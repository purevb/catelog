class CategoryModel {
  int? id;
  String name;
  String iconPth;

  CategoryModel({
    this.id,
    required this.name,
    required this.iconPth,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      iconPth: json['iconPth'],
    );
  }
}
