import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:upoint/models/category_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  void _getCategories() {
    setState(() {
      categories = CategoryModel.getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f4f9),
      appBar: appBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          search(width),
          SizedBox(height: 20),
          category(),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 325.48,
            width: 342.51,
            decoration: BoxDecoration(
                color: Color(0xff6c5de6),
                borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 31.33,
                        width: 31.33,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                'assets/fire.png',
                              )),
                              shape: BoxShape.circle,
                              color: Color(0xff5a4dc9)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Онцлох",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 103,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Бүгд",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5a4dc9),
                        ),
                      ))
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 183.86,
                    width: 307.63,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)),
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container category() {
    return Container(
      height: 103.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 14),
        itemBuilder: (context, index) {
          return Container(
            width: 87.13,
            decoration: BoxDecoration(
              color: Color(0xfff2f4f9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  height: 61.9,
                  width: 87.13,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xfff2f4f9),
                          blurRadius: 4,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        categories[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  child: ClipOval(
                    child: Container(
                      width: 80.1,
                      height: 80.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(categories[index].iconPth),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container search(double width) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Хайх',
          hintStyle: TextStyle(color: Color(0xff7E89AB), fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/search.jpg',
              width: 20,
              height: 20,
            ),
          ),
          suffixIcon: Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/shat.jpg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(0xfff2f4f9),
      title: Text(
        "Купон каталог",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}
