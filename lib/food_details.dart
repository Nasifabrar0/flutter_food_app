import 'package:flutter/material.dart';
import 'package:food_app/cons.dart';
import 'package:food_app/strings.dart';

import 'widget/topbar_icon.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: topBarIcon(
                icon: Icons.arrow_back,
                onClick: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.grey,
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 280,
              actions: [
                topBarIcon(
                  icon: Icons.shopping_cart,
                  onClick: () {},
                ),
                topBarIcon(
                  icon: Icons.favorite,
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Chinese Side food'),
                background: Image.network(
                  dummyImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(Strings.description),
            )
          ],
        ),
        bottomNavigationBar: Container(
          // color: Color.fromARGB(83, 10, 4, 66),
          margin:
              const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  topBarIcon(
                    icon: Icons.add,
                    onClick: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    color: Colors.black,
                    iconColor: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      quantity.toString(),
                      style: Cons.headingStyle,
                    ),
                  ),
                  topBarIcon(
                    icon: Icons.remove,
                    onClick: () {
                      setState(() {
                        if (quantity > 1) {
                          quantity--;
                        }
                      });
                    },
                    color: Colors.black,
                    iconColor: Colors.white,
                  ),
                ],
              ),
              MaterialButton(
                height: 50,
                minWidth: double.maxFinite,
                shape: const StadiumBorder(),
                color: Colors.grey,
                onPressed: () {},
                child: const Text(
                  '\$18 | Add to cart',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
