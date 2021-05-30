import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/order-summary-screen.dart';
import 'package:smart_dressing_user_app/screens/virtually-try-on-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

class ProductDetailsScreenOrderDetailsContainer extends StatefulWidget {
  final List<bool> productDiscountStatus;
  final List<String> productPrice;
  final List<String> productQuantity;
  final List<String> productSize;
  final BuildContext context;
  final List<String> productName;
  final List<String> imageUrl;
  final List<String> productDetails;
  final List<String> productId;
  final bool isAddedToCart;
  final int containerNumber;
  final List<String> productCategory;
  const ProductDetailsScreenOrderDetailsContainer({
    Key key,
    this.productDiscountStatus,
    this.productPrice,
    this.productQuantity,
    this.productSize,
    this.context,
    this.productName,
    this.imageUrl,
    this.productDetails,
    this.productId,
    this.isAddedToCart,
    this.containerNumber,
    this.productCategory,
  }) : super(key: key);

  @override
  _ProductDetailsScreenOrderDetailsContainerState createState() =>
      _ProductDetailsScreenOrderDetailsContainerState();
}

class _ProductDetailsScreenOrderDetailsContainerState
    extends State<ProductDetailsScreenOrderDetailsContainer> {
  List<String> productQuantity = List.filled(1000, '0', growable: true);

  addValueInProductQuantity() {
    productQuantity.insert(widget.containerNumber, dropdownValue);
  }

  List<String> getSizes() {
    List<String> productSizes = widget.productSize[0].split(',');
    return productSizes;
  }

  bool isAddedToCart = false;
  getAddToCartValue() {
    setState(() {
      isAddedToCart = widget.isAddedToCart;
    });
  }

  var _fireStore = FirebaseFirestore.instance;

  String selectedSize;
  String dropdownValue = '1';
  List<Widget> getSizeContainer() {
    List<Widget> sizeContainers = [];
    for (String i in getSizes()) {
      sizeContainers.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = i;
            });
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              border: selectedSize == i
                  ? Border.all(color: Color(kBackgroundColor))
                  : Border.all(
                      color: Colors.transparent,
                    ),
            ),
            child: Center(
              child: Text(
                '$i',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return sizeContainers;
  }

  @override
  void initState() {
    selectedSize = getSizes()[widget.containerNumber];
    getAddToCartValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 15,
      ),
      color: Colors.white,
      height: 450,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.productDiscountStatus[widget.containerNumber]
              ? SizedBox()
              : Text(
                  'Today Deal: Rs${widget.productPrice[widget.containerNumber]}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(kBackgroundColor),
                  ),
                ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Shipping for just Rs 150',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          double.parse(widget.productQuantity[0]) > 0
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'In Stock',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(kBackgroundColor),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Quantity',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownValue,
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                  '9',
                                  '10',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    onTap: () {
                                      setState(() {
                                        dropdownValue = value;
                                      });
                                    },
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF181B20),
                              ),
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                color: Colors.white,
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Size name: $selectedSize',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Row(
                                      children: getSizeContainer(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size name: $selectedSize',
                              style: TextStyle(
                                  color: Color(kBackgroundColor), fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(kBackgroundColor),
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (LogInScreen.userIsBuyer == true) {
                          if (!isAddedToCart) {
                            LogInScreen.subTotal = LogInScreen.subTotal +
                                int.parse(widget
                                    .productPrice[widget.containerNumber]);
                            _fireStore
                                .collection('products')
                                .doc(widget.productId[widget.containerNumber])
                                .update(
                              {
                                'isAddedToCart': true,
                                'subTotal': LogInScreen.subTotal
                              },
                            );
                          } else {
                            LogInScreen.subTotal = LogInScreen.subTotal -
                                int.parse(widget
                                    .productPrice[widget.containerNumber]);
                            _fireStore
                                .collection('products')
                                .doc(widget.productId[widget.containerNumber])
                                .update(
                              {
                                'isAddedToCart': false,
                                'subTotal': LogInScreen.subTotal
                              },
                            );
                          }
                          setState(() {
                            isAddedToCart = !isAddedToCart;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: isAddedToCart
                                  ? Text('Successfully added to cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ))
                                  : Text(
                                      'Removed from cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                        side: isAddedToCart
                            ? BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              )
                            : BorderSide.none,
                      ),
                      color: isAddedToCart
                          ? Colors.white
                          : Color(kBackgroundColor),
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: isAddedToCart ? Colors.black : Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            isAddedToCart ? 'Remove From Cart' : 'Add To Cart',
                            style: TextStyle(
                              color:
                                  isAddedToCart ? Colors.black : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                      ),
                      color: Color(kBackgroundColor),
                      onPressed: () {
                        if (LogInScreen.userIsBuyer == true) {
                          addValueInProductQuantity();
                          List<String> productName = [];
                          productName
                              .add(widget.productName[widget.containerNumber]);
                          List<String> productQuantity = [];
                          productQuantity.add(
                              widget.productQuantity[widget.containerNumber]);
                          List<String> productPrice = [];
                          productPrice
                              .add(widget.productPrice[widget.containerNumber]);
                          List<String> imageUrl = [];
                          imageUrl.add(widget.imageUrl[widget.containerNumber]);
                          List<String> productDetails = [];
                          productDetails.add(
                              widget.productDetails[widget.containerNumber]);
                          List<String> productCategory = [];
                          productCategory.add(
                              widget.productCategory[widget.containerNumber]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderSummaryScreen(
                                        productName: productName,
                                        productQuantity: productQuantity,
                                        productPrice: productPrice,
                                        imageUrl: imageUrl,
                                        productDetails: productDetails,
                                        productCategory: productCategory,
                                        containerNumber: widget.containerNumber,
                                      )));
                        }
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Color(kBackgroundColor),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                      ),
                      color: Color(kBackgroundColor),
                      onPressed: () {
                        if (LogInScreen.userIsBuyer == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VirtuallyTryOnScreen(
                                        imageUrl: widget.imageUrl[0],
                                      )));
                        }
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Virtually Try-On',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Text(
                  'Out of stock',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(kBackgroundColor),
                  ),
                ),
        ],
      ),
    );
  }
}
