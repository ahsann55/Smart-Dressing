import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/product-detail-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

class ProductDisplayContainer extends StatelessWidget {
  ProductDisplayContainer({
    this.image,
    this.name,
    this.price,
    this.details,
    this.productQuantity,
    this.productSize,
    this.productRating,
    this.productDiscountStatus,
    this.isAddedToCart,
    this.isAddedToWishList,
    this.productId,
    this.containerNumber,
    this.productCategory,
    this.productGender,
  });
  final List<String> image;
  final List<String> name;
  final List<String> price;
  final List<String> details;
  final List<String> productRating;
  final List<String> productSize;
  final List<String> productQuantity;
  final List<bool> productDiscountStatus;
  final List<String> productId;
  final bool isAddedToCart;
  final bool isAddedToWishList;
  final int containerNumber;
  final List<String> productCategory;
  final List<String> productGender;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productDetails: details,
              imageUrl: image,
              productPrice: price,
              productName: name,
              productQuantity: productQuantity,
              productSize: productSize,
              productRating: productRating,
              productDiscountStatus: productDiscountStatus,
              productId: productId,
              containerNumber: containerNumber,
              productCategory: productCategory,
              productGender: productGender,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Image(
                    image: NetworkImage(image[containerNumber]),
                    fit: BoxFit.contain,
                    height: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Text(
                    name[containerNumber],
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Text(
                    price[containerNumber],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Text(
                    details[containerNumber],
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 16),
                  ),
                ),
              ],
            ),
            height: 300,
            width: 245,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(5, 15),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
            height: 320,
          ),
        ],
      ),
    );
  }
}
