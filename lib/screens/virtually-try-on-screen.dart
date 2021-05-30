import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:smart_dressing_user_app/services/api.dart';
import 'dart:convert';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class VirtuallyTryOnScreen extends StatefulWidget {
  static final String id = 'VirtuallyTryOnScreen';
  const VirtuallyTryOnScreen({
    Key key,
    this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  _VirtuallyTryOnScreenState createState() => _VirtuallyTryOnScreenState();
}

class _VirtuallyTryOnScreenState extends State<VirtuallyTryOnScreen> {
  bool showSpinner = false;
  var data;
  var image1;
  var image2;
  String url;
  getUrl() {
    return url =
        'http://127.0.0.1:5000/serverTest?image1=$image1&image2=$image2';
  }

  @override
  void initState() {
    image2 = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(kBackgroundColor),
          title: Text(
            'Virtually Try-On',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text(
                  'Your Selected Product:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Image(
                  image: NetworkImage(widget.imageUrl),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Center(
                  child: MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Color(kBackgroundColor),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF181B20),
                            ),
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Material(
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Select your Photo:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000001_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000001_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000010_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000010_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000028_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000028_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000143_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000143_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000228_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000228_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000240_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000240_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000248_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000248_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000284_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000284_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000303_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000303_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000330_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000330_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000347_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000347_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000395_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000395_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000404_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000404_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000456_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000456_0.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                image1 = '000466_0.jpg';
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                height: 150,
                                                width: 130,
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/000466_0.jpg',
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
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Select Your photo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Center(
                  child: MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    height: 50,
                    minWidth: 80,
                    color: Colors.white,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      data = await Getdata(getUrl());
                      var decodeData = jsonDecode(data);
                      setState(() {
                        showSpinner = false;
                      });
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      'http://localhost:8000/result/TOM/test/try-on/$decodeData'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.0)),
                                  ),
                                  minWidth: 90,
                                  height: 40,
                                  color: Color(kBackgroundColor),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  elevation: 10,
                                  child: Text(
                                    'Try other photo',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Try-On',
                          style: TextStyle(
                            color: Color(kBackgroundColor),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
