class CategoryModel {
  String name;
  String iconPth;

  CategoryModel({
    required this.name,
    required this.iconPth,
  });
  
  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(name:'Хоол, ундаа', iconPth:'assets/Hool.png')
    );
    categories.add(
      CategoryModel(name:'Хүнс', iconPth:'assets/Huns.png')
    );
    categories.add(
      CategoryModel(name:'Үзвэр, үйлчилгээ', iconPth:'assets/Uzver.png')
    );
    categories.add(
      CategoryModel(name:'Ахуй', iconPth:'assets/Hool.png')
    );
    
    return categories;
  }
}
