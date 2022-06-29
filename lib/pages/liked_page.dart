import 'package:flutter/material.dart';
import 'package:food_app/cons.dart';
import 'package:food_app/strings.dart';
import 'package:food_app/utils/app_color.dart';
import 'package:food_app/widget/topbar_icon.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.bgColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          topBarIcon(icon: Icons.shopping_cart, onClick: () {}),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints.expand(),
        child: GridView.builder(
            itemCount: 11,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                childAspectRatio: 100 / 110,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(dummyImage),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Expanded(
                          child: Text('Food Name',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: Text(
                            Strings.description,
                            overflow: TextOverflow.ellipsis,
                            style: Cons.subHeadingStyle,
                          ),
                        ),
                        const Expanded(child: Text('\$ 120'))
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.grey.shade900,
                        )),
                  )
                ],
              );
            }),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 24,
          bottom: 10,
          right: 24,
        ),
        child: MaterialButton(
          shape: const StadiumBorder(),
          color: Colors.grey.shade600,
          onPressed: () {},
          child: const Text(
            'Remove all 11 item(s)',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
