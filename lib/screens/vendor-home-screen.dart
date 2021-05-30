import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:smart_dressing_user_app/widgets/custom-side-drawer.dart';
import 'package:smart_dressing_user_app/widgets/productDisplayContainer.dart';

import 'add-product-screen.dart';
import 'login-screen.dart';

class VendorHomeScreen extends StatefulWidget {
  static final String id = 'VendorHomeScreen';
  @override
  _VendorHomeScreenState createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  List<Widget> getFeaturedProducts(int start, int end) {
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
    for (int i = start; i < end; i++) {
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
        name: productPrice,
        details: productDetails,
        productCategory: productCategory,
        containerNumber: containerNumber,
        productId: productId,
        isAddedToWishList: LogInScreen.isAddedToWishList[i],
        isAddedToCart: LogInScreen.isAddedToCart[i],
        productQuantity: productQuantity,
        productSize: productSize,
        productRating: productRating,
        productDiscountStatus: productDiscountStatus,
        productGender: productGender,
      ));
    }
    return popularProducts;
  }

  List<Widget> getActiveOrders(int start, int end) {
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
    for (int i = start; i < end; i++) {
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
        name: productPrice,
        details: productDetails,
        productCategory: productCategory,
        containerNumber: containerNumber,
        productId: productId,
        isAddedToWishList: LogInScreen.isAddedToWishList[i],
        isAddedToCart: LogInScreen.isAddedToCart[i],
        productQuantity: productQuantity,
        productSize: productSize,
        productRating: productRating,
        productDiscountStatus: productDiscountStatus,
        productGender: productGender,
      ));
    }
    return popularProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSideDrawer(),
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text('Vendor Home Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your Featured Products ',
                          style: TextStyle(
                              color: Color(kBackgroundColor),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: getFeaturedProducts(0, 2),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your Active Orders',
                      style: TextStyle(
                          color: Color(kBackgroundColor),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: getActiveOrders(0, 2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
