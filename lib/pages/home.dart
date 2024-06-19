import 'dart:async';
import 'dart:convert';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:upoint/models/category_model.dart';
import 'package:upoint/models/others_model.dart';
import 'package:upoint/models/special_model.dart';
import 'package:upoint/models/suggested_model.dart';
import 'package:upoint/models/super_model.dart';

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

  Future<List<SuperModel>> supers() async {
    final String rest = await rootBundle.loadString('assets/json/super.json');
    final List<dynamic> datat = json.decode(rest);
    return datat.map((json) => SuperModel.fromJson(json)).toList();
  }

  Future<List<SuggestedModel>> suggest() async {
    final String suggest =
        await rootBundle.loadString('assets/json/suggested.json');
    final List<dynamic> datata = json.decode(suggest);
    return datata.map((json) => SuggestedModel.fromJson(json)).toList();
  }

  Future<List<OtherModel>> other() async {
    final String other = await rootBundle.loadString('assets/json/other.json');
    final List<dynamic> otherdata = json.decode(other);
    return otherdata.map((json) => OtherModel.fromJson(json)).toList();
  }

  // List<Container> cards = [
  //   Container(
  //     child: coupon([0]),
  //   ),
  //   Container(
  //     child: const Text('2'),
  //   ),
  //   Container(
  //     child: const Text('3'),
  //   )
  // ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //392.72
    double height = MediaQuery.of(context).size.height; //783.27

    return Scaffold(
        backgroundColor: Color(0xfff2f4f9),
        appBar: appBar(),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: height / 39.1635),
                search(width, height),
                SizedBox(height: height / 39.1635),
                category(width, height),
                SizedBox(height: height / 39.1635),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: height / 2.606729233226837,
                  width: width / 1.146594260021605,
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
                              height: height / 25.00063836578359,
                              width: width / 12.53495052665177,
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
                              child: const Align(
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
                          width: width / 19.636,
                        ),
                        Container(
                          width: width / 5.531267605633803,
                          height: height / 32.63625,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(left: 10),
                              backgroundColor: Color(0xff5a4dc9),
                            ),
                            child: SizedBox(
                              width: width / 5.531267605633803,
                              height: height / 32.63625,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                      height: height / 39.1635,
                    ),
                    Stack(
                      children: [
                        Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return coupon(index, width, height);
                          },
                          autoplay: false,
                          itemCount: 3,
                          itemWidth: width / 1.190060606060606,
                          itemHeight: height / 4.28016393442623,
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
                superstar(width, height),
                Column(
                  children: [
                    suggested(height, width),
                    sale(height, width),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 10, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  child: Row(
                                children: [
                                  Container(
                                    width: width / 21.93966480446927,
                                    height: height / 43.75810055865922,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/zurag/star.png'),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Бусад",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: width / 5.531267605633803,
                                height: height / 32.63625,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Бүгд",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.navigate_next_rounded,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 78.327,
                        ),
                        FutureBuilder<List<OtherModel>>(
                          future: other(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (snapshot.hasData) {
                              List<OtherModel> other = snapshot.data!;
                              return Container(
                                margin: EdgeInsets.only(left: 20),
                                height: height / 3.25,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: width / 2.4545,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: height / 71.20636363636364,
                                          ),
                                          Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              Container(
                                                height:
                                                    height / 7.459714285714286,
                                                width:
                                                    width / 2.887647058823529,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              other[index]
                                                                  .imgPth))),
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                left: 5,
                                                child: SizedBox(
                                                  height: height /
                                                      34.05521739130435,
                                                  width:
                                                      width / 17.07478260869565,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                other[index]
                                                                    .ownerImgPath))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height / 78.327,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width:
                                                      width / 42.57127371273713,
                                                  height: height /
                                                      49.32430730478589,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xfff2f4f9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                100),
                                                        bottomRight:
                                                            Radius.circular(
                                                                100),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    child: Flex(
                                                      direction:
                                                          Axis.horizontal,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: List.generate(
                                                          12,
                                                          (index) => SizedBox(
                                                              width: 6,
                                                              height: 1,
                                                              child:
                                                                  DecoratedBox(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.6),
                                                                ),
                                                              ))),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      width / 42.57127371273713,
                                                  height: height /
                                                      49.32430730478589,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xfff2f4f9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                100),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                100),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 261.09,
                                          ),
                                          SizedBox(
                                            width: width / 2.887647058823529,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text: other[index]
                                                            .description,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' ${other[index].sale.toString()}%  Off',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xffE54016),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 111.89,
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: height / 43.515,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '4,450₮',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff5a4dc9),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height / 43.515,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '${other[index].price}₮',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xffBBB4F4),
                                                                fontSize: 12,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   width: 50,
                                                // ),
                                                Container(
                                                  child: IntrinsicWidth(
                                                    child: SizedBox(
                                                      height: height / 28.17,
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          backgroundColor:
                                                              Color(0xfff1effc),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                '${other[index].upoint}',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff5a4dc9),
                                                                  fontSize: 12,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            SizedBox(width: 4),
                                                            Container(
                                                              width: width /
                                                                  16.36333333333333,
                                                              height: height /
                                                                  32.63625,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
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
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                          width: width / 32.72666666666667),
                                  itemCount: other.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 15.6654,
                )
              ],
            ),
          ],
        ));
  }

  Column sale(double height, double width) {
    return Column(
      children: [
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
                    "100% off",
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FutureBuilder<List<SuggestedModel>>(
          future: suggest(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              List<SuggestedModel> suggest = snapshot.data!;
              return Container(
                margin: EdgeInsets.only(left: 20),
                height: height / 3.25,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: width / 2.4545,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                height: 105,
                                width: 136,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              suggest[index].imgPth))),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: SizedBox(
                                  height: height / 34.05521739130435,
                                  width: width / 17.07478260869565,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                suggest[index].ownerImgPath))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 42.57127371273713,
                                  height: height / 49.32430730478589,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xfff2f4f9),
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
                                          12,
                                          (index) => SizedBox(
                                              width: 6,
                                              height: 1,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                ),
                                              ))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 9.225,
                                  height: 15.88,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xfff2f4f9),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 136,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: suggest[index].description,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${suggest[index].sale.toString()}%  Off',
                                        style: TextStyle(
                                          color: Color(0xffE54016),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 111.89,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height / 43.515,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '4,450₮',
                                              style: TextStyle(
                                                color: Color(0xff5a4dc9),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height / 43.515,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '${suggest[index].price}₮',
                                              style: TextStyle(
                                                color: Color(0xffBBB4F4),
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: 50,
                                // ),
                                Container(
                                  child: IntrinsicWidth(
                                    child: SizedBox(
                                      height: height / 28.17,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          backgroundColor: Color(0xfff1effc),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                '${suggest[index].upoint}',
                                                style: TextStyle(
                                                  color: Color(0xff5a4dc9),
                                                  fontSize: 12,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Container(
                                              width: width / 16.36333333333333,
                                              height: height / 32.63625,
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
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: suggest.length,
                  scrollDirection: Axis.horizontal,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  Column suggested(double height, double width) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 10, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  child: Row(
                children: [
                  Container(
                    width: width / 21.93966480446927,
                    height: height / 43.75810055865922,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/zurag/star.png'),
                      ),
                    ),
                  ),
                  Text(
                    "Санал болгох",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              SizedBox(
                width: width / 5.524929577464789,
                height: height / 32.63625,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FutureBuilder<List<SuggestedModel>>(
          future: suggest(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              List<SuggestedModel> suggest = snapshot.data!;
              return Container(
                margin: EdgeInsets.only(left: 20),
                height: height / 3.25,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: width / 2.4545,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                height: height / 7.459714285714286,
                                width: width / 2.887647058823529,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              suggest[index].imgPth))),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: SizedBox(
                                  height: height / 34.05521739130435,
                                  width: width / 17.07478260869565,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                suggest[index].ownerImgPath))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 9.225,
                                  height: 15.88,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xfff2f4f9),
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
                                          12,
                                          (index) => SizedBox(
                                              width: 6,
                                              height: 1,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                ),
                                              ))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 9.225,
                                  height: 15.88,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xfff2f4f9),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: width / 2.887647058823529,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: suggest[index].description,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${suggest[index].sale.toString()}%  Off',
                                        style: TextStyle(
                                          color: Color(0xffE54016),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 111.89,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height / 43.515,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '4,450₮',
                                              style: TextStyle(
                                                color: Color(0xff5a4dc9),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height / 43.515,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '${suggest[index].price}₮',
                                              style: TextStyle(
                                                color: Color(0xffBBB4F4),
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: 50,
                                // ),
                                Container(
                                  child: IntrinsicWidth(
                                    child: SizedBox(
                                      height: height / 28.17,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          backgroundColor: Color(0xfff1effc),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                '${suggest[index].upoint}',
                                                style: TextStyle(
                                                  color: Color(0xff5a4dc9),
                                                  fontSize: 12,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
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
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: suggest.length,
                  scrollDirection: Axis.horizontal,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  Column superstar(double width, double height) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 10, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  child: Row(
                children: [
                  Container(
                    width: width / 21.93966480446927,
                    height: height / 43.75810055865922,
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
                width: width / 5.524929577464789,
                height: height / 32.63625,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FutureBuilder<List<SuperModel>>(
          future: supers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              List<SuperModel> sup = snapshot.data!;
              return Container(
                margin: EdgeInsets.only(left: 20),
                height: height / 3.25,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: width / 2.4545,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                height: height / 7.459714285714286,
                                width: width / 2.887647058823529,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(sup[index].imgPth))),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: SizedBox(
                                  height: height / 34.05521739130435,
                                  width: width / 17.07478260869565,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                sup[index].ownerImgPath))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 9.225,
                                  height: 15.88,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xfff2f4f9),
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
                                          12,
                                          (index) => SizedBox(
                                              width: 6,
                                              height: 1,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                ),
                                              ))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 9.225,
                                  height: 15.88,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xfff2f4f9),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 136,
                            height: 56,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            // 'Монголын борхон айраг Бор айраг '
                                            sup[index].description,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            // '38% Off\n'
                                            ' ${sup[index].sale.toString()}%  Off\n',
                                        style: TextStyle(
                                          color: Color(0xffE54016),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 135,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color(0xfff0eefc),
                                    border: Border.all(
                                        width: 1, color: Color(0xff7040fe)),
                                    borderRadius: BorderRadius.circular(9))),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: sup.length,
                  scrollDirection: Axis.horizontal,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  FutureBuilder<List<SpecialModel>> coupon(index, width, height) {
    return FutureBuilder<List<SpecialModel>>(
      future: special(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.data}'));
        } else if (snapshot.hasData) {
          List<SpecialModel> special = snapshot.data!;
          return Container(child: ListView.builder(
            itemBuilder: (context, index) {
              Stack(
                children: [
                  Container(
                    height: height / 3.89958179826745,
                    width: width / 1.120041068933063,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                                width: width / 2.708413793103448,
                                height: height / 6.931592920353982,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                      // 'assets/zurag/ontsloh.png'
                                      special[index].imgPth,
                                    )),
                                  ),
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  height: height / 7.8327,
                                  width: width / 2.997862595419847,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height / 15.35823529411765,
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  // 'Монголын борхон айраг Бор айраг '
                                                  special[index].description,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      height / 65.2725.floor(),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text:
                                                  // '38% Off\n'z
                                                  '{$special[index].sale} +Off',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize:
                                                    height / 65.2725.floor(),
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
                                        height: height / 43.515,
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  // '9,900₮ '
                                                  '{$special[index].price.toString()}',
                                              style: TextStyle(
                                                color: Color(0xff5a4dc9),
                                                fontSize:
                                                    height / 65.2725.floor(),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  // '4,450₮'
                                                  '${special[index].price * special[index].sale / 100.floor()}₮',
                                              style: TextStyle(
                                                color: Color(0xff5a4dc9),
                                                fontSize:
                                                    height / 65.2725.floor(),
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
                                width: 7.2,
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
                                              width: width / 19.44819038175508,
                                              height:
                                                  height / 38.83341596430342,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/zurag/honog.png'),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // " 2 хоног "
                                              '${special[index].day} хоног',
                                              style: TextStyle(
                                                  color: Color(0xff5a4dc9)),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5)),
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
                                              width: width / 24.286951144094,
                                              height:
                                                  height / 48.43970315398887,
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
                                              // " 10ш үлдсэн "
                                              ' ${special[index].quantity}ш үлдсэн ',
                                              style: TextStyle(
                                                  color: Color(0xff5a4dc9)),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5)),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: SizedBox(
                                    height: height / 19.58175,
                                    width: width / 6.13625,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.only(left: 10),
                                        backgroundColor: Color(0xfff1effc),
                                      ),
                                      child: SizedBox(
                                        height: height / 19.58175,
                                        width: width / 6.13625,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                // "10"
                                                '${special[index].upoint}',
                                                style: TextStyle(
                                                    color: Color(0xff5a4dc9))),
                                            SizedBox(width: 4),
                                            Container(
                                              width: width / 16.36333333333333,
                                              height: height / 32.63625,
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
            },
          ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  FutureBuilder<List<CategoryModel>> category(double width, double height) {
    return FutureBuilder<List<CategoryModel>>(
      future: readJson(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.data}'));
        } else if (snapshot.hasData) {
          List<CategoryModel> cate = snapshot.data!;
          return SizedBox(
            height: height / 7.593504604944256,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: cate.length,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {},
                    child: Container(
                      width: width / 4.216901105980887,
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f4f9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            height: height / 14.01198568872987,
                            width: width / 4.507287960518765,
                            bottom: -3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: -2,
                            child: ClipOval(
                              child: Container(
                                width: width / 4.218259935553169,
                                height: height / 8.413211600429646,
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
                    ));
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Container search(double width, double height) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: height / 19.58175,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Хайх',
          hintStyle: const TextStyle(color: Color(0xff7E89AB), fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/zurag/search.jpg',
              width: width / 19.636,
              height: height / 39.1635,
            ),
          ),
          suffixIcon: SizedBox(
            width: width / 3.9272,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/zurag/shat.jpg',
                    width: width / 19.636,
                    height: height / 39.1635,
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
      backgroundColor: const Color(0xfff2f4f9),
      centerTitle: true,
      title: const Text(
          "Купон каталог",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
