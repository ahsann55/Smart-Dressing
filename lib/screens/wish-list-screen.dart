import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_dressing_user_app/screens/shopping-cart-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

class WishList extends StatefulWidget {
  static final String id = 'WishList';
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color(kBackgroundColor),
              title: Text(
                'Wishlist',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ShoppingCart.id);
                    },
                    child: Icon(
                      FontAwesomeIcons.shoppingCart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 15),
                        child: Image(
                          image: AssetImage('assets/images/product1.jpg'),
                          fit: BoxFit.contain,
                          height: 70,
                        ),
                      ),
                      Container(
                        width: 130,
                        child: Column(
                          children: [
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
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1.0,
                                offset: Offset(3, 6),
                                blurRadius: 2.0),
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rs. 5000',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      color: Color(kBackgroundColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Divider(
                      thickness: 1,
                      height: 5,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 15),
                        child: Image(
                          image: AssetImage('assets/images/product2.jpg'),
                          fit: BoxFit.contain,
                          height: 70,
                        ),
                      ),
                      Container(
                        width: 130,
                        child: Column(
                          children: [
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
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1.0,
                                offset: Offset(3, 6),
                                blurRadius: 2.0),
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rs. 8000',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      color: Color(kBackgroundColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Divider(
                      thickness: 1,
                      height: 5,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 15),
                        child: Image(
                          image: AssetImage('assets/images/product1.jpg'),
                          fit: BoxFit.contain,
                          height: 70,
                        ),
                      ),
                      Container(
                        width: 130,
                        child: Column(
                          children: [
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
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1.0,
                                offset: Offset(3, 6),
                                blurRadius: 2.0),
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rs. 5000',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      color: Color(kBackgroundColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Divider(
                      thickness: 1,
                      height: 5,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 15),
                        child: Image(
                          image: AssetImage('assets/images/product2.jpg'),
                          fit: BoxFit.contain,
                          height: 70,
                        ),
                      ),
                      Container(
                        width: 130,
                        child: Column(
                          children: [
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
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1.0,
                                offset: Offset(3, 6),
                                blurRadius: 2.0),
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rs. 8000',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      color: Color(kBackgroundColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Divider(
                      thickness: 1,
                      height: 5,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
