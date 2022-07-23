import 'package:flutter/material.dart';
import 'package:food_app/cons.dart';
import 'package:food_app/network/common_func.dart';
import 'package:food_app/network/network_helper.dart';
import 'package:food_app/strings.dart';

import 'widget/topbar_icon.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key, required this.foodData}) : super(key: key);

  final foodData;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 1;

@override
  void initState() {
    
    super.initState();
    print(widget.foodData);
  }
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
                    NetworkHelper().addToFavorite('nasif@gmail.com', widget.foodData['id']);
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.foodData['title']),
                background: Opacity(
                  opacity: 0.75,
                
                  child: Image.network(
                    
                    widget.foodData['image'],
                    
                  
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(widget.foodData['description']),
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
                onPressed: () {
                  NetworkHelper().addToCart('nasif@gmail.com', widget.foodData['id'], quantity);
                  CommonFunc().showSnackMsg('Successfully added to cart', context);
                },
                child:  Text(
                  '\$${widget.foodData['price']} | Add to cart',
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
