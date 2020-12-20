import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/settings-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

import 'SideDrawerCustomListTile.dart';

class MySideDrawer extends StatefulWidget {
  @override
  _MySideDrawerState createState() => _MySideDrawerState();
}

class _MySideDrawerState extends State<MySideDrawer> {
  bool isProfileUploaded = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            height: 200,
            width: double.maxFinite,
            color: Color(kBackgroundColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  child: isProfileUploaded
                      ? SizedBox()
                      : Text(
                          'A',
                          style: TextStyle(color: Colors.red, fontSize: 40),
                        ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Ahsan Raza',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'ahsann@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          SideDrawerCustomListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            title: Text(
              'Home',
              style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
            ),
            leadingIcon: Icon(
              Icons.home,
              color: Color(kBackgroundColor),
              size: 28,
            ),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              color: Color(kBackgroundColor),
              size: 20,
            ),
          ),
          SideDrawerCustomListTile(
            onTap: () {},
            title: Text(
              'Your Order',
              style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
            ),
            leadingIcon: Icon(
              Icons.shopping_cart,
              color: Color(kBackgroundColor),
              size: 28,
            ),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              color: Color(kBackgroundColor),
              size: 20,
            ),
          ),
          SideDrawerCustomListTile(
            onTap: () {},
            title: Text(
              'About Us',
              style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
            ),
            leadingIcon: Icon(
              FontAwesomeIcons.solidAddressBook,
              color: Color(kBackgroundColor),
              size: 25,
            ),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              color: Color(kBackgroundColor),
              size: 20,
            ),
          ),
          SideDrawerCustomListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsScreen.id);
            },
            title: Text(
              'Settings',
              style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
            ),
            leadingIcon: Icon(
              FontAwesomeIcons.cog,
              color: Color(kBackgroundColor),
              size: 25,
            ),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              color: Color(kBackgroundColor),
              size: 20,
            ),
          ),
          SideDrawerCustomListTile(
            onTap: () {},
            title: Text(
              'Transactions',
              style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
            ),
            leadingIcon: Icon(
              FontAwesomeIcons.exchangeAlt,
              color: Color(kBackgroundColor),
              size: 28,
            ),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              color: Color(kBackgroundColor),
              size: 20,
            ),
          ),
          SideDrawerCustomListTile(
            onTap: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, LogInScreen.id);
            },
            title: Text(
              'Log out',
              style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
            ),
            leadingIcon: Icon(
              Icons.logout,
              color: Color(kBackgroundColor),
              size: 28,
            ),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              color: Color(kBackgroundColor),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
