import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_dressing_user_app/screens/shopping-cart-screen.dart';
import 'package:smart_dressing_user_app/screens/wish-list-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:smart_dressing_user_app/widgets/SideDrawerCustomListTile.dart';
import 'package:smart_dressing_user_app/widgets/custom-carousel-pro.dart';
import 'package:smart_dressing_user_app/widgets/custom-side-drawer.dart';

import 'login-screen.dart';

FirebaseUser loggedInUser;

class HomeScreen extends StatefulWidget {
  static final String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  String searchProduct;
  bool isSearchSelected = false;
  bool isProfileUploaded = false;
  CountdownController countdownController = CountdownController(
    duration: Duration(
      hours: 2,
      minutes: 59,
      seconds: 59,
    ),
  );
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  getSearchProduct(value) {
    searchProduct = value;
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
    setState(() {
      countdownController.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(kBackgroundColor),
          title: isSearchSelected
              ? Container(
                  width: 200,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.search,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 155,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: getSearchProduct,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  'Smart Dressing',
                  style: TextStyle(color: Colors.white),
                ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isSearchSelected
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearchSelected = false;
                              });
                            },
                            child: Icon(Icons.clear),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearchSelected = true;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.search,
                              size: 20,
                            ),
                          ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ShoppingCart.id);
                      },
                      child: Icon(
                        FontAwesomeIcons.shoppingCart,
                        size: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WishList.id);
                      },
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: MySideDrawer(),
        body: Material(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 10,
                        child: CarouselPro(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Select Category',
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 210,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                              offset: Offset(5, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/stitched.jpg'),
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Stitched',
                              style: TextStyle(
                                color: Color(kBackgroundColor),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 210,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                              offset: Offset(5, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/unstitched.jpg'),
                              fit: BoxFit.contain,
                              height: 130,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Unstitched',
                              style: TextStyle(
                                color: Color(kBackgroundColor),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Popular Products',
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 24),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product1.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 1',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 5000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product2.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 2',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 8000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product1.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 3',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 5000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product2.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 4',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 8000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 450,
                    color: Color(kBackgroundColor),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/stop-watch.png'),
                                height: 80,
                              ),
                              Text(
                                'Flash',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Sale',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              Text(
                                'End Sale in :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${countdownController.currentRemainingTime.hours}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  Text(
                                    ' : ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  Text(
                                    '${countdownController.currentRemainingTime.min}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  Text(
                                    ' : ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  Text(
                                    '${countdownController.currentRemainingTime.sec}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 350,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/product1.jpg'),
                                  fit: BoxFit.contain,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'ProductName 1',
                                  style: TextStyle(
                                      color: Color(kBackgroundColor),
                                      fontSize: 21),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'Rs. 5000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'Product Details: ',
                                  style: TextStyle(
                                      color: Color(kBackgroundColor),
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/product2.jpg'),
                                  fit: BoxFit.contain,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'ProductName 2',
                                  style: TextStyle(
                                      color: Color(kBackgroundColor),
                                      fontSize: 21),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'Rs. 8000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'Product Details: ',
                                  style: TextStyle(
                                      color: Color(kBackgroundColor),
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Latest Arrivals',
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 24),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product1.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 1',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 5000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product2.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 2',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 8000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product1.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 3',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 5000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Image(
                                image: AssetImage('assets/images/product2.jpg'),
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'ProductName 4',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Rs. 8000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                'Product Details: ',
                                style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
