import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/cons.dart';
import 'package:food_app/food_details.dart';
import 'package:food_app/network/network_helper.dart';
import 'package:food_app/pages/profile.dart';
import 'package:food_app/pages/slider_details.dart';
import 'package:food_app/utils/app_color.dart';

import 'cart.dart';
import 'liked_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndext = 0;
  List pages = const [HomePage(), LikedPage(), CartPage(), SliderDetails()];
  List foods = [];

  @override
  void initState() {
    super.initState();
    getFoodData();
  }

  getFoodData() async {
    foods = await NetworkHelper().getFoodData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(ResponsiveSize.deviceHeight);
    return SafeArea(
      child: Scaffold(
        body: foods.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  _buildHeadingTitle(),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildPage(),
                        _builIndicator(),
                        _buildRecommentTitle(),
                        _buildRecommendedCard(),
                      ],
                    ),
                  )
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            onTap: (index) {
              setState(() {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LikedPage(),
                      ));
                } else if (index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ));
                }
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Liked'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      ),
    );
  }

  DotsIndicator _builIndicator() {
    return DotsIndicator(
      dotsCount: 10,
      position: currentPageIndext.toDouble(),
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  Widget _buildRecommendedCard() {
    return SizedBox(
      height: (132 + 14) * foods.length.toDouble(),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetails(foodData: foods[index],),
                  )),
              child: Container(
                margin: const EdgeInsets.all(7),
                height: 132,
                width: double.infinity,
                // color: Colors.pink,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.white,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(foods[index]['image']))),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foods[index]['title'],
                                style: TextStyle(
                                    color: AppColor.buttonColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 8),
                                child: Text(
                                  'Type: ${foods[index]['type']}',
                                  style: Cons.subHeadingStyle,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$ ${foods[index]['price']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.buttonColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const FaIcon(
                                      FontAwesomeIcons.basketShopping,
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildHeadingTitle() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Bangldesh',
                style: Cons.headingStyle,
              ),
              Row(
                children: const [
                  Text(
                    'Rangpur',
                    style: Cons.subHeadingStyle,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade400),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Padding _buildRecommentTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
      child: Row(
        children: const [
          Text(
            'Popular',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Food pairing',
            style: Cons.subHeadingStyle,
          ),
        ],
      ),
    );
  }

  SizedBox _buildPage() {
    return SizedBox(
      height: 220,
      width: double.infinity,
      // color: Colors.yellow,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          onPageChanged: (indext, _) {
            setState(() {
              currentPageIndext = indext;
            });
          },
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          aspectRatio: 2.0,
          initialPage: 2,
        ),
        itemCount: 10,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SliderDetails()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              // color: Colors.blue,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                        borderRadius: BorderRadius.circular(10)),
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      height: 116,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            'Chinese Side',
                            style: Cons.headingStyle,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Wrap(
                                  children: List.generate(
                                    5,
                                    (index) => const Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('4.5', style: Cons.subHeadingStyle),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('128 comments',
                                    style: Cons.subHeadingStyle)
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Normal',
                                    style: Cons.subHeadingStyle,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '15km',
                                    style: Cons.subHeadingStyle,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '12min',
                                    style: Cons.subHeadingStyle,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
