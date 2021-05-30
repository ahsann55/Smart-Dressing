import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/shopping-cart-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smart_dressing_user_app/widgets/product-details-screen-order-detail-container.dart';
import 'package:smart_dressing_user_app/widgets/product-images-container.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:smart_dressing_user_app/widgets/productDisplayContainer.dart';

import 'login-screen.dart';

class ProductDetailScreen extends StatefulWidget {
  static final String id = 'ProductDetailScreen';
  ProductDetailScreen({
    this.productName,
    this.productRating,
    this.productDetails,
    this.imageUrl,
    this.productDiscountStatus,
    this.productPrice,
    this.productQuantity,
    this.productSize,
    this.productId,
    this.containerNumber,
    this.productCategory,
    this.productGender,
  });
  final List<String> productName;
  final List<String> productRating;
  final List<String> productDetails;
  final List<String> imageUrl;
  final List<bool> productDiscountStatus;
  final List<String> productPrice;
  final List<String> productQuantity;
  final List<String> productSize;
  final List<String> productId;
  final List<String> productGender;
  final int containerNumber;
  final List<String> productCategory;
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  getRecommendedProducts() {
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

    List<ProductDisplayContainer> recommended = [];
    int loopCount = 0;
    for (int i = 0; i < LogInScreen.productCategory.length; i++) {
      if (widget.productCategory[widget.containerNumber] ==
              LogInScreen.productCategory[i] &&
          widget.productGender[widget.containerNumber] ==
              LogInScreen.productGender[i]) {
        productId.add(LogInScreen.productId[loopCount]);
        productSize.add(LogInScreen.productSize[loopCount]);
        productQuantity.add(LogInScreen.productQuantity[loopCount]);
        productPrice.add(LogInScreen.productPrice[loopCount]);
        productDiscountStatus.add(LogInScreen.productDiscountStatus[loopCount]);
        imageUrl.add(LogInScreen.productPhoto[loopCount]);
        productDetails.add(LogInScreen.productDetails[loopCount]);
        containerNumber = loopCount;
        productRating.add(LogInScreen.productRating[loopCount]);
        productName.add(LogInScreen.productName[loopCount]);
        productCategory.add(LogInScreen.productCategory[loopCount]);
        recommended.add(ProductDisplayContainer(
          image: imageUrl,
          price: productPrice,
          name: productName,
          details: productDetails,
          productDiscountStatus: productDiscountStatus,
          productRating: productRating,
          productSize: productSize,
          productQuantity: productQuantity,
          isAddedToCart: LogInScreen.isAddedToCart[loopCount],
          isAddedToWishList: LogInScreen.isAddedToWishList[loopCount],
          productId: productId,
          containerNumber: containerNumber,
          productCategory: productCategory,
          productGender: widget.productGender,
        ));
        loopCount = loopCount + 1;
      }
    }
    return recommended;
  }

  List<bool> isAddedToCart = [];
  List<bool> isAddedToWishList = [];
  bool showSpinner = false;
  var _fireStore = FirebaseFirestore.instance;
  int addToCartLoopCount = -1;
  getCartValues() async {
    setState(() {
      showSpinner = true;
    });
    final productsReference = _fireStore.collection('products');
    QuerySnapshot product = await productsReference
        .where('id', isEqualTo: widget.productId[widget.containerNumber])
        .get();
    setState(() {
      product.docs.forEach((element) {
        isAddedToCart.add(element['isAddedToCart']);
        isAddedToWishList.add(element['isAddedToWishList']);
        addToCartLoopCount = addToCartLoopCount + 1;
      });
    });
    setState(() {
      showSpinner = false;
    });
  }

  @override
  void initState() {
    setState(() {
      getCartValues();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: Material(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Color(kBackgroundColor),
                  title: Text(
                    'Product Details',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingCart()));
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productName[widget.containerNumber],
                            style: TextStyle(
                                color: Color(kBackgroundColor), fontSize: 18),
                          ),
                          RatingBar(
                            ratingWidget: RatingWidget(
                                empty: Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                ),
                                half: Icon(
                                  Icons.star_half,
                                  color: Colors.amber,
                                ),
                                full: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                )),
                            onRatingUpdate: (value) {},
                            direction: Axis.horizontal,
                            initialRating: double.parse(
                              widget.productRating[widget.containerNumber],
                            ),
                            itemCount: 5,
                            itemSize: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '(${widget.productDetails[widget.containerNumber]})',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      ProductImagesContainer(
                        image: widget.imageUrl[widget.containerNumber],
                        isAddedToWishList:
                            isAddedToWishList[addToCartLoopCount],
                        productId: widget.productId[widget.containerNumber],
                      ),
                      ProductDetailsScreenOrderDetailsContainer(
                        productPrice: widget.productPrice,
                        productDiscountStatus: widget.productDiscountStatus,
                        productQuantity: widget.productQuantity,
                        productSize: widget.productSize,
                        context: context,
                        productName: widget.productName,
                        imageUrl: widget.imageUrl,
                        productDetails: widget.productDetails,
                        productId: widget.productId,
                        isAddedToCart: isAddedToCart[addToCartLoopCount],
                        containerNumber: widget.containerNumber,
                        productCategory: widget.productCategory,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LogInScreen.userIsBuyer
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, left: 10),
                              child: Text(
                                'Personal Recommendations:',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            )
                          : SizedBox(),
                      Row(
                          children: LogInScreen.userIsBuyer
                              ? getRecommendedProducts()
                              : [
                                  SizedBox(),
                                ]),
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
