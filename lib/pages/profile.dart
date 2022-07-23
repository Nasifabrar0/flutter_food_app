import 'package:flutter/material.dart';
import 'package:food_app/cons.dart';
import 'package:food_app/network/network_helper.dart';
import 'package:food_app/utils/app_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgColor,
          elevation: 0,
          foregroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            Container(
              height: screenHeight * .25,
              width: double.maxFinite,
              color: AppColor.bgColor,
              padding: const EdgeInsets.only(bottom: 40),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(proPic), fit: BoxFit.fill),
                          shape: BoxShape.circle,
                          color: Colors.amber),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: screenWidth * .5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.bgColor,
                      ),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_a_photo_outlined)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Name:'),
                    subtitle: Text('Nafis Abrar'),
                    trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    title: Text('Email:'),
                    subtitle: Text('example@mail.com'),
                    trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    title: Text('Phone:'),
                    subtitle: Text('01789645213'),
                    trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    title: Text('City:'),
                    subtitle: Text('Rangpur'),
                    trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    title: Text('Address:'),
                    subtitle: Text('CO road, Badarganj'),
                    trailing: Icon(Icons.edit),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: IconButton(
            onPressed: () {
              NetworkHelper().addData();
            },
            icon: const Icon(Icons.add)),
      ),
    );
  }
}
