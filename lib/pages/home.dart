import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:upoint/models/category_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:upoint/models/special_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<CategoryModel>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }

  Future<List<SpecialModel>> special() async {
    final String res = await rootBundle.loadString('assets/json/special.json');
    final List<dynamic> data = json.decode(res);
    return data.map((json) => SpecialModel.fromJson(json)).toList();
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
            padding: EdgeInsets.only(top: 20),
            height: 300.48,
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
                                'assets/zurag/fire.png',
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
                    width: 71,
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 10),
                        backgroundColor: Color(0xff5a4dc9),
                      ),
                      child: SizedBox(
                        width: 71,
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Бүгд",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return coupon();
                    },
                    autoplay: false,
                    itemCount: 3,
                    itemWidth: 330.0,
                    itemHeight: 183.0,
                    scrollDirection: Axis.horizontal,
                    pagination: SwiperPagination(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 195),
                    ),
                    layout: SwiperLayout.TINDER,
                  ),
                ],
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    child: Row(
                  children: [
                    Container(
                      width: 17.90,
                      height: 17.9,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/zurag/star.png'),
                        ),
                      ),
                    ),
                    Text(
                      "Супер",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                SizedBox(
                  width: 71,
                  height: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Бүгд",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  FutureBuilder<List<SpecialModel>> coupon() {
    return FutureBuilder<List<SpecialModel>>(
        future: special(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('${snapshot.data}'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            List<SpecialModel> special = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 200.86,
                  width: 350.63,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                              width: 145,
                              height: 113,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                    'assets/zurag/ontsloh.png'
                                    // special[index].imgPth
                                    ,
                                  )),
                                ),
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: SizedBox(
                                height: 100,
                                width: 131,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 51,
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text:
                                                'Монголын борхон айраг Бор айраг '
                                                // special[index].description
                                                ,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: 
                                            '38% Off\n'
                                            // special[index].sale +'Off\n'
                                            ,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 18,
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: 
                                            '9,900₮ '
                                            // special[index].price
                                            ,
                                            style: TextStyle(
                                              color: Color(0xff5a4dc9),
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 
                                            '4,450₮'
                                        // '${special[index].price*special[index].sale/100.floor()}₮'
                                            ,
                                            style: TextStyle(
                                              color: Color(0xff5a4dc9),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 7.175,
                              height: 14.35,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xff6c5de6),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      20,
                                      (index) => SizedBox(
                                          width: 6,
                                          height: 1,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                            ),
                                          ))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7.175,
                              height: 14.35,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xff6c5de6),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    IntrinsicHeight(
                                        child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20.17,
                                            height: 20.17,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/zurag/honog.png'),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            " 2 хоног "
                                            // '${special[index].day} хоног'
                                            ,
                                            style: TextStyle(
                                                color: Color(0xff5a4dc9)),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    IntrinsicHeight(
                                        child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 16.17,
                                            height: 16.17,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/zurag/ticket.png'
                                                    // special[index].imgPth
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            " 10ш үлдсэн "
                                            // ' ${special[index].quantity}ш үлдсэн '
                                            ,
                                            style: TextStyle(
                                                color: Color(0xff5a4dc9)),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  height: 40,
                                  width: 64,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.only(left: 10),
                                      backgroundColor: Color(0xfff1effc),
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      width: 64,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "10"
                                            // '${special[index].upoint}'
                                            ,
                                              style: TextStyle(
                                                  color: Color(0xff5a4dc9))),
                                          SizedBox(width: 4),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/zurag/symbol.png'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                )
              ],
            );
          }
        });
  }

  FutureBuilder<List<CategoryModel>> category() {
    return FutureBuilder<List<CategoryModel>>(
      future: readJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('${snapshot.data}'));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data found'));
        } else {
          List<CategoryModel> cate = snapshot.data!;
          return Container(
            height: 103.15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: cate.length,
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
                              cate[index].name,
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
                                image: AssetImage(cate[index].iconPth),
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
      },
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
              'assets/zurag/search.jpg',
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
                    'assets/zurag/shat.jpg',
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
