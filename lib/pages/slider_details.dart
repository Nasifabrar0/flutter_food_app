import 'package:flutter/material.dart';
import 'package:food_app/strings.dart';

import '../cons.dart';

class SliderDetails extends StatefulWidget {
  const SliderDetails({Key? key}) : super(key: key);

  @override
  State<SliderDetails> createState() => _SliderDetailsState();
}

class _SliderDetailsState extends State<SliderDetails> {
  late var firstHalf;
  int quantity = 1;
  bool isDescriptionExpanded = false;

  @override
  void initState() {
    super.initState();
    if (Strings.description.length < 200) {
      firstHalf = Strings.description;
    } else {
      firstHalf = Strings.description.substring(0, 200);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.arrow_back)),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.shopping_cart))
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 230,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                // margin: const EdgeInsets.only(right: 20, left: 20),
                height: 116,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chinese Side',
                      style: Cons.headingStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
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
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 14),
                      child: const Text('Introduction'),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(isDescriptionExpanded
                              ? Strings.description
                              : firstHalf),
                          Row(
                            children: [
                              TextButton(
                                child: Text(isDescriptionExpanded
                                    ? 'show less'
                                    : 'show more'),
                                onPressed: () {
                                  setState(() {
                                    isDescriptionExpanded =
                                        !isDescriptionExpanded;
                                  });
                                },
                              ),
                              Icon(isDescriptionExpanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey.shade300,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      child: const Text('-'),
                    ),
                    Text('$quantity'),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: const Text('+'))
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: MaterialButton(
                shape: const StadiumBorder(),
                color: Colors.grey,
                onPressed: () {},
                child: const Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
