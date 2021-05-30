import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/order-summary-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

// ignore: must_be_immutable
class OrderSummaryDisplayContainer extends StatelessWidget {
  OrderSummaryDisplayContainer({
    Key key,
    this.imageUrl,
    this.productName,
    this.productPrice,
    this.productQuantity,
    this.productDetails,
    this.productCategory,
    this.containerNumber,
  }) : super(key: key);
  final List<String> imageUrl;
  final List<String> productName;
  final List<String> productPrice;
  final List<String> productQuantity;
  final List<String> productDetails;
  final List<String> productCategory;
  final int containerNumber;
  getSubtotal() {
    int subTotal;
    if (LogInScreen.subTotal == 0) {
      subTotal = int.parse(productPrice[containerNumber]);
    } else {
      subTotal = LogInScreen.subTotal;
    }

    return subTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                          color: Color(kBackgroundColor),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(imageUrl[containerNumber]),
                            height: 180,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName[containerNumber],
                                  style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  productDetails[containerNumber],
                                  style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Rs${productPrice[containerNumber]}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.grey[500],
                        thickness: 1,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Rs${getSubtotal()}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Rs150',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.grey[500],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
