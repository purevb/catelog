class SpecialModel {
  int id;
  String description;
  String sale;
  String price;
  String day;
  String quantity;
  String upoint;
  String imgPth;

  SpecialModel({
    required this.id,
    required this.description,
    required this.sale,
    required this.price,
    required this.day,
    required this.quantity,
    required this.upoint,
    required this.imgPth,

  });

  factory SpecialModel.fromJson(Map<String, dynamic> json) {
    return SpecialModel(
      id: json['id'],
      description: json['description'],
      sale: json['sale'],
      price: json['price'],
      day: json['day'],
      quantity: json['quantity'],
      upoint: json['upoint'],
      imgPth: json['imgPth'],
    );
  }
  
}
