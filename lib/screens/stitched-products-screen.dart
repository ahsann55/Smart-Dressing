import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_dressing_user_app/screens/product-detail-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:smart_dressing_user_app/widgets/stitched-product-container.dart';
import 'package:smart_dressing_user_app/widgets/select-filter.dart';

import 'login-screen.dart';

class StitchedProductsScreen extends StatefulWidget {
  static final String id = 'ProductsScreen';
  @override
  _StitchedProductsScreenState createState() => _StitchedProductsScreenState();
}

class _StitchedProductsScreenState extends State<StitchedProductsScreen> {
  bool isSearchSelected = false;
  getSearchProduct(value) {
    searchProduct = value;
  }

  List<Widget> getStitchedProducts() {
    int loopCount = -1;
    List<StitchedProductContainer> popularProducts = [];
    for (var i in LogInScreen.productCategory) {
      loopCount += 1;
      if (i == 'stitched') {
        popularProducts.add(StitchedProductContainer(
          imageUrl: LogInScreen.productPhoto[loopCount],
          productPrice: LogInScreen.productPrice[loopCount],
          productName: LogInScreen.productName[loopCount],
          productDetails: LogInScreen.productDetails[loopCount],
          productDiscountedPrice: LogInScreen.productPrice[loopCount],
          isDiscountAvailable: LogInScreen.productDiscountStatus[loopCount],
          productRating: LogInScreen.productRating[loopCount],
          productId: LogInScreen.productId[loopCount],
        ));
      }
    }
    if (popularProducts.isEmpty) {
      return null;
    } else {
      return popularProducts;
    }
  }

  String searchProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            : Text(
                'Stitched Products',
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
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
                ],
              ),
            ),
          ),
        ],
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                height: 60,
                elevation: 10,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SelectFilter(),
                      ),
                    ),
                  );
                },
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.dehaze,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: getStitchedProducts() == null
                      ? [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 30),
                            child: Text(
                              'No Products added yet',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                            ),
                          )
                        ]
                      : getStitchedProducts(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
