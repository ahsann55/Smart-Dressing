import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:smart_dressing_user_app/widgets/SideDrawerCustomListTile.dart';
import 'package:smart_dressing_user_app/widgets/custom-side-drawer.dart';

class SettingsScreen extends StatefulWidget {
  static final String id = 'SettingsScreen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MySideDrawer(),
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Material(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SideDrawerCustomListTile(
              onTap: () {},
              title: Text(
                'User Agreement',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            SideDrawerCustomListTile(
              onTap: () {},
              title: Text(
                'Terms and Condition',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            SideDrawerCustomListTile(
              onTap: () {},
              title: Text(
                'Contact Us',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            SideDrawerCustomListTile(
              onTap: () {},
              title: Text(
                'Invite Friends',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
