import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/cons.dart';
import 'package:food_app/food_details.dart';
import 'package:food_app/pages/slider_details.dart';
import 'package:food_app/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndext = 0;

  @override
  Widget build(BuildContext context) {
    // print(ResponsiveSize.deviceHeight);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
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
        ),
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
    return Container(
      height: (150 + 14) * 10,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetails(),
                  )),
              child: Container(
                margin: const EdgeInsets.all(7),
                height: 130,
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
                                image: NetworkImage(dummyImage))),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 110,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chinese Side ${index + 1}'),
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
                                    const Text('4.5',
                                        style: Cons.subHeadingStyle),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text('128 comments',
                                        style: Cons.subHeadingStyle)
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    children: const [
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
                                    children: const [
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
        children: [
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
                    height: 160,
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
