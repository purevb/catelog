class SuperModel {
  int id;
  String description;
  int sale;
  int price;
  int day;
  int upoint;
  String imgPth;
  String ownerImgPath;

  SuperModel({
    required this.id,
    required this.description,
    required this.sale,
    required this.price,
    required this.day,
    required this.upoint,
    required this.imgPth,
    required this.ownerImgPath,
  });

  factory SuperModel.fromJson(Map<String, dynamic> json) {
    return SuperModel(
      id: json['id'],
      description: json['description'],
      sale: json['sale'],
      price: json['price'],
      day: json['day'],
      upoint: json['upoint'],
      imgPth: json['imgPth'],
      ownerImgPath: json['ownerImgPath'],
    );
  }
}
