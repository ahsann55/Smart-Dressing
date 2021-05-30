import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/vendor-home-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

import 'home-screen.dart';
import 'login-screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    Key key,
    this.emailAddress,
    this.productPrice,
    this.productQuantity,
    this.productDetails,
    this.productName,
    this.imageUrl,
    this.address,
    this.cityName,
    this.countryName,
    this.firstName,
    this.lastName,
    this.optionalAddress,
    this.phoneNumber,
    this.zipCode,
    this.total,
    this.height,
    this.armLength,
    this.chest,
    this.collar,
    this.legHeight,
    this.shoulders,
    this.torsoHeight,
    this.waist,
    this.containerNumber,
  }) : super(key: key);
  final String countryName;
  final String firstName;
  final String lastName;
  final String address;
  final String optionalAddress;
  final String cityName;
  final String zipCode;
  final String emailAddress;
  final String phoneNumber;
  final List<String> imageUrl;
  final List<String> productName;
  final List<String> productPrice;
  final List<String> productQuantity;
  final List<String> productDetails;
  final int total;
  final containerNumber;
  final String height;
  final String torsoHeight;
  final String legHeight;
  final String waist;
  final String armLength;
  final String chest;
  final String shoulders;
  final String collar;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              AppBar(
                backgroundColor: Color(kBackgroundColor),
                title: Text(
                  'Payment',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Total:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rs$total',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Contact',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 80,
                                height: 5,
                              ),
                              Text(
                                '$emailAddress',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Ship to',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 85,
                              ),
                              Flexible(
                                child: Text(
                                  '$address $optionalAddress $cityName $zipCode $countryName',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Method',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                'Cash on Delivery',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 50,
            ),
            child: MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Column(
                        children: [
                          Text(
                            'Your Order has been placed. We will let you know about order details.Thank you for shopping here.',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                            minWidth: 90,
                            height: 40,
                            color: Color(kBackgroundColor),
                            onPressed: () {
                              if (LogInScreen.userIsBuyer == true) {
                                Navigator.pushReplacementNamed(
                                    context, HomeScreen.id);
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, VendorHomeScreen.id);
                              }
                            },
                            elevation: 10,
                            child: Text(
                              'Continue Shopping',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                      elevation: 10,
                    );
                  },
                );
              },
              height: 55,
              minWidth: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Purchase',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rs$total',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              color: Color(kBackgroundColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
