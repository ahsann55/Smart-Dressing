import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/stitched-products-screen.dart';
import 'package:smart_dressing_user_app/screens/shopping-cart-screen.dart';
import 'package:smart_dressing_user_app/screens/un-stitched-products-screen.dart';
import 'package:smart_dressing_user_app/screens/wish-list-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:smart_dressing_user_app/widgets/custom-carousel-pro.dart';
import 'package:smart_dressing_user_app/widgets/custom-side-drawer.dart';
import 'package:smart_dressing_user_app/widgets/productDisplayContainer.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchProduct;
  bool isSearchSelected = false;
  bool isProfileUploaded = false;
  getSearchProduct(value) {
    searchProduct = value;
  }

  List<Widget> getPopularProducts(int start, int end) {
    List<String> productName = [];

    List<String> productRating = [];

    List<String> productDetails = [];

    List<String> imageUrl = [];

    List<bool> productDiscountStatus = [];

    List<String> productPrice = [];

    List<String> productQuantity = [];

    List<String> productSize = [];

    List<String> productId = [];

    int containerNumber;

    List<String> productCategory = [];

    List<String> productGender = [];

    List<ProductDisplayContainer> popularProducts = [];
    for (int i = start; i <= end; i++) {
      productId.add(LogInScreen.productId[i]);
      productSize.add(LogInScreen.productSize[i]);
      productQuantity.add(LogInScreen.productQuantity[i]);
      productPrice.add(LogInScreen.productPrice[i]);
      productDiscountStatus.add(LogInScreen.productDiscountStatus[i]);
      imageUrl.add(LogInScreen.productPhoto[i]);
      productDetails.add(LogInScreen.productDetails[i]);
      containerNumber = i;
      productRating.add(LogInScreen.productRating[i]);
      productName.add(LogInScreen.productName[i]);
      productCategory.add(LogInScreen.productCategory[i]);
      productGender.add(LogInScreen.productGender[i]);

      popularProducts.add(ProductDisplayContainer(
        image: imageUrl,
        price: productPrice,
        name: productName,
        details: productDetails,
        productDiscountStatus: productDiscountStatus,
        productRating: productRating,
        productSize: productSize,
        productQuantity: productQuantity,
        isAddedToCart: LogInScreen.isAddedToCart[i],
        isAddedToWishList: LogInScreen.isAddedToWishList[i],
        productId: productId,
        containerNumber: containerNumber,
        productCategory: productCategory,
        productGender: productGender,
      ));
    }
    return popularProducts;
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
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Smart Dressing',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
        drawer: CustomSideDrawer(),
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
                        width: 180,
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, StitchedProductsScreen.id);
                          },
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
                      ),
                      Container(
                        height: 210,
                        width: 180,
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, UnStitchedProductsScreen.id);
                          },
                          child: Column(
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/unstitched.jpg'),
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
                    children: getPopularProducts(0, 2),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                                  CountdownFormatted(
                                      duration: Duration(hours: 6),
                                      builder: (BuildContext context,
                                          String remaining) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            remaining,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: getPopularProducts(0, 2),
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
                    children: getPopularProducts(0, 2),
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
