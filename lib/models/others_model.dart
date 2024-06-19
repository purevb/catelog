class OtherModel {
  int id;
  String description;
  int sale;
  int price;
  int day;
  int quantity;
  int upoint;
  String imgPth;
  String ownerImgPath;

  OtherModel({
    required this.id,
    required this.description,
    required this.sale,
    required this.price,
    required this.day,
    required this.quantity,
    required this.upoint,
    required this.imgPth,
    required this.ownerImgPath
  });

  factory OtherModel.fromJson(Map<String, dynamic> json) {
    return OtherModel(
      id: json['id'],
      description: json['description'],
      sale: json['sale'],
      price: json['price'],
      day: json['day'],
      quantity: json['quantity'],
      upoint: json['upoint'],
      imgPth: json['imgPth'],
      ownerImgPath: json['ownerImgPath'],

    );
  }
}
