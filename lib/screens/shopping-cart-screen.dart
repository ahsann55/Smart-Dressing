import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

class ShoppingCart extends StatefulWidget {
  static final String id = 'ShoppingCart';
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  String dropdownValue = '1';
  bool isWishListIconSelected = false;
  String price = '5000';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Color(kBackgroundColor),
            title: Text(
              'Shopping Cart',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  '1 Item in list',
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
                child: Divider(
                  thickness: 1,
                  height: 5,
                  color: Colors.grey[600],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 15),
                          child: Image(
                            image: AssetImage('assets/images/product1.jpg'),
                            fit: BoxFit.contain,
                            height: 70,
                          ),
                        ),
                        Container(
                          width: 130,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'ProductName 1',
                                  style: TextStyle(
                                      color: Color(kBackgroundColor),
                                      fontSize: 21),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'Product Details: ',
                                  style: TextStyle(
                                      color: Color(kBackgroundColor),
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1.0,
                                  offset: Offset(3, 6),
                                  blurRadius: 2.0),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isWishListIconSelected =
                                    !isWishListIconSelected;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: isWishListIconSelected
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rs. $price',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quantity: ',
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
              ),
              SizedBox(
                height: 10,
                child: Divider(
                  thickness: 1,
                  height: 5,
                  color: Colors.grey[600],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub total amount is',
                          style: TextStyle(
                            color: Color(kBackgroundColor),
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          'Rs. ${int.parse(price) * int.parse(dropdownValue)}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '(Total does not include shipping)',
                        style: TextStyle(color: Colors.grey[700], fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      color: Color(kBackgroundColor),
                      child: Text(
                        'Check Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: MaterialButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      color: Colors.white,
                      child: Text(
                        'Continue Shopping',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
