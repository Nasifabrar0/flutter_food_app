import 'package:cloud_firestore/cloud_firestore.dart';

class NetworkHelper {
  var db = FirebaseFirestore.instance;

  addData() {}
  getFoodData() async {
    var foods = [];

    await db.collection('food').get().then((value) {
      for (var element in value.docs) {
        foods.add({
          'title': element['title'],
          'description': element['description'],
          'image': element['image'],
          'price': element['price'],
          'type': element['type'],
          'id' : element.id
        });
      }

      // for (var i = 0; i < foods.length; i++) {
      //   print(foods[i]);
      // }
    });

    return foods;
  }

  addToFavorite(emailId, foodId) async {
    await db.collection('food_user').doc(emailId).update({
      'favorite_food' : FieldValue.arrayUnion([foodId])
    });
  }


  addToCart(emailId, foodId, quantity) async {
    await db.collection('food_user').doc(emailId).update({
      'cart' : FieldValue.arrayUnion([{'id' : foodId, 'quantity' : quantity}])
    });
  }
  // addData() async {
  //   await db
  //       .collection('food')
  //       .doc()
  //       .set({
  //         'title': 'Chicken Sandwich',
  //         'price': '110',
  //         'type': 'Sandwich',
  //         'image':
  //             'https://www.crazymasalafood.com/wp-content/images/normal-chicken-sandwich.jpg',
  //         'description':
  //             'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
  //       })
  //       .then((value) => db.collection('food').doc().set({
  //             'title': 'Egg Sandwich',
  //             'price': '113',
  //             'type': 'Sandwich',
  //             'image':
  //                 'https://www.crazymasalafood.com/wp-content/images/egg-sandwich.jpg',
  //             'description':
  //                 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
  //           }))
  //       .then((value) => db.collection('food').doc().set({
  //             'title': 'Fish Sandwich',
  //             'price': '115',
  //             'type': 'Sandwich',
  //             'image':
  //                 'https://www.crazymasalafood.com/wp-content/images/fish-sandwich.jpg',
  //             'description':
  //                 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
  //           }))
  //       .then((value) => db.collection('food').doc().set({
  //             'title': 'Fried Egg Sandwich',
  //             'price': '120',
  //             'type': 'Sandwich',
  //             'image':
  //                 'https://www.crazymasalafood.com/wp-content/images/fried-egg-sandiwch.jpg',
  //             'description':
  //                 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
  //           }))
  //       .then((value) => db.collection('food').doc().set({
  //             'title': 'Grilled Cheese Sandwich',
  //             'price': '153',
  //             'type': 'Sandwich',
  //             'image':
  //                 'https://www.crazymasalafood.com/wp-content/images/grilled-cheese-sandwich-1.jpg',
  //             'description':
  //                 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
  //           }));
  // }
}
