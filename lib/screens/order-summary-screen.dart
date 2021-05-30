import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/customer-measurments-screen.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/shipping-information-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:smart_dressing_user_app/widgets/order-summary-display-container.dart';

// ignore: must_be_immutable
class OrderSummaryScreen extends StatefulWidget {
  static final String id = 'OrderSummaryScreen';
  OrderSummaryScreen({
    Key key,
    this.imageUrl,
    this.productName,
    this.productPrice,
    this.productQuantity,
    this.productDetails,
    this.productCategory,
    this.total,
    this.containerNumber,
  }) : super(key: key);
  final List<String> imageUrl;
  final List<String> productName;
  final List<String> productPrice;
  final List<String> productQuantity;
  final List<String> productDetails;
  final List<String> productCategory;
  final int containerNumber;
  int total;

  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  getTotal() {
    if (LogInScreen.subTotal == 0) {
      widget.total =
          int.parse(widget.productPrice[widget.containerNumber]) + 150;
    } else {
      widget.total = LogInScreen.subTotal + 150;
    }

    return widget.total;
  }

  List<bool> isAddedToCart = [];

  getProducts() {
    List<OrderSummaryDisplayContainer> products = [];
    for (int i = 0; i < widget.productName.length; i++) {
      products.add(OrderSummaryDisplayContainer(
        containerNumber: i,
        imageUrl: widget.imageUrl,
        productCategory: widget.productCategory,
        productDetails: widget.productDetails,
        productName: widget.productName,
        productPrice: widget.productPrice,
        productQuantity: widget.productQuantity,
      ));
    }
    return products;
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Color(kBackgroundColor),
              title: Text('CHECKOUT'),
            ),
            Column(
              children: getProducts(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Rs${getTotal()}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    bool isStitched = false;
                    for (var i in widget.productCategory) {
                      if (i == 'stitched') {
                        isStitched = true;
                      } else {}
                    }
                    if (isStitched) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShippingInformationScreen(
                                    productName: widget.productName,
                                    productQuantity: widget.productQuantity,
                                    productPrice: widget.productPrice,
                                    imageUrl: widget.imageUrl,
                                    productDetails: widget.productDetails,
                                    total: widget.total,
                                    containerNumber: widget.containerNumber,
                                  )));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerMeasurementScreen(
                                  productName: widget.productName,
                                  productQuantity: widget.productQuantity,
                                  productPrice: widget.productPrice,
                                  imageUrl: widget.imageUrl,
                                  productDetails: widget.productDetails,
                                  total: widget.total)));
                    }
                  },
                  minWidth: 250,
                  height: 50,
                  color: Color(kBackgroundColor),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
