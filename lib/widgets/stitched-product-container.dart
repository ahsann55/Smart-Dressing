import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/product-detail-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

class StitchedProductContainer extends StatefulWidget {
  StitchedProductContainer({
    this.imageUrl,
    this.productDetails,
    this.productDiscountedPrice,
    this.productName,
    this.productPrice,
    this.productRating,
    this.isDiscountAvailable,
    this.productId,
  });
  final String imageUrl;
  final String productName;
  final String productDetails;
  final String productRating;
  final String productPrice;
  final String productDiscountedPrice;
  final bool isDiscountAvailable;
  final String productId;
  @override
  _StitchedProductContainerState createState() =>
      _StitchedProductContainerState();
}

class _StitchedProductContainerState extends State<StitchedProductContainer> {
  int loopCount = -1;
  getLoopCountValue() {
    for (var i in LogInScreen.productId) {
      loopCount += 1;
      if (widget.productId == LogInScreen.productId[loopCount]) {
        break;
      }
    }
  }

  @override
  void initState() {
    getLoopCountValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<String> productName = [];
        productName.add(LogInScreen.productName[loopCount]);
        List<String> productRating = [];
        productRating.add(LogInScreen.productRating[loopCount]);
        List<String> productDetails = [];
        productDetails.add(LogInScreen.productDetails[loopCount]);
        List<String> imageUrl = [];
        imageUrl.add(LogInScreen.productPhoto[loopCount]);
        List<bool> productDiscountStatus = [];
        productDiscountStatus.add(LogInScreen.productDiscountStatus[loopCount]);
        List<String> productPrice = [];
        productPrice.add(LogInScreen.productPrice[loopCount]);
        List<String> productQuantity = [];
        productQuantity.add(LogInScreen.productQuantity[loopCount]);
        List<String> productSize = [];
        productSize.add(LogInScreen.productSize[loopCount]);
        List<String> productId = [];
        productId.add(LogInScreen.productId[loopCount]);
        int containerNumber;
        containerNumber = loopCount;
        List<String> productGender = [];
        productGender.add(LogInScreen.productGender[loopCount]);
        List<String> productCategory;
        productCategory.add(LogInScreen.productCategory[loopCount]);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      productName: productName,
                      productRating: productRating,
                      productDetails: productDetails,
                      imageUrl: imageUrl,
                      productDiscountStatus: productDiscountStatus,
                      productPrice: productPrice,
                      productQuantity: productQuantity,
                      productSize: productSize,
                      productId: productId,
                      containerNumber: containerNumber,
                      productGender: productGender,
                      productCategory: productCategory,
                    )));
      },
      child: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Image(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.contain,
                    width: 120,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                              color: Color(kBackgroundColor), fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Text(
                            widget.productDetails,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        RatingBarIndicator(
                          itemPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                          rating: double.parse(widget.productPrice),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          itemCount: 5,
                          itemSize: 23,
                          direction: Axis.horizontal,
                        ),
                        widget.isDiscountAvailable
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      '\$${widget.productDiscountedPrice}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      '\$${widget.productPrice}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: Text(
                                  '\$ ${widget.productPrice}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
