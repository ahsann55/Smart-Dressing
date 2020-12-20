import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/forgot-password-screen.dart';
import 'package:smart_dressing_user_app/screens/home-screen.dart';
import 'package:smart_dressing_user_app/screens/sign-up-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LogInScreen extends StatefulWidget {
  static final String id = 'LogInScreen';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GoogleSignInAccount _currentUser;
  String _contactText;
  final googleAuth = GoogleSignIn();
  final fbLogin = FacebookLogin();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;
  onChangedEmail(value) {
    email = value;
  }

  onChangedPassword(value) {
    password = value;
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = jsonDecode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Material(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Image.asset(
                      'assets/images/logo-removebg.png',
                      colorBlendMode: BlendMode.dstATop,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      height: 55,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            height: 50,
                            width: 290,
                            child: Material(
                              color: Colors.transparent,
                              child: TextField(
                                onChanged: (value) {
                                  onChangedEmail(value);
                                },
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      height: 55,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            height: 50,
                            width: 290,
                            child: Material(
                              color: Colors.transparent,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  onChangedPassword(value);
                                },
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPassword.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          setState(() {
                            showSpinner = true;
                          });
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            setState(() {
                              showSpinner = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      },
                      color: Colors.white,
                      height: 55,
                      minWidth: MediaQuery.of(context).size.width - 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Center(
                      child: Text(
                        'or login with',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                final result = await googleAuth.signIn();
                                result.authentication.then((value) {
                                  _auth
                                      .signInWithCustomToken(value.accessToken)
                                      .then((value) {
                                    Navigator.of(context)
                                        .pushReplacementNamed(HomeScreen.id);
                                  });
                                }).catchError((e) {
                                  showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Column(
                                        children: [
                                          Text(
                                            'Failed to authenticate!',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7.0))),
                                            minWidth: 90,
                                            height: 40,
                                            color: Color(kBackgroundColor),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            elevation: 10,
                                            child: Text(
                                              'Try Again',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                      elevation: 10,
                                    ),
                                  );
                                });
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Column(
                                      children: [
                                        Text(
                                          'Failed to authenticate!',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7.0))),
                                          minWidth: 90,
                                          height: 40,
                                          color: Color(kBackgroundColor),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          elevation: 10,
                                          child: Text(
                                            'Try Again',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ],
                                    ),
                                    elevation: 10,
                                  ),
                                );
                              }
                            },
                            child: Image.asset(
                              'assets/images/google-plus-logo.png',
                              width: 35,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final result = await fbLogin
                                  .logIn(['email', 'public_profile']);
                              switch (result.status) {
                                case FacebookLoginStatus.loggedIn:
                                  final token = result.accessToken.token;
                                  final graphResponse = await http.get(
                                      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
                                  final profile =
                                      jsonDecode(graphResponse.body);
                                  _auth.signInWithCustomToken(token);
                                  Navigator.pushReplacementNamed(
                                      context, HomeScreen.id);
                                  break;
                                case FacebookLoginStatus.cancelledByUser:
                                  showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Column(
                                        children: [
                                          Text(
                                            'Failed to authenticate!',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7.0))),
                                            minWidth: 90,
                                            height: 40,
                                            color: Color(kBackgroundColor),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            elevation: 10,
                                            child: Text(
                                              'Try Again',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                      elevation: 10,
                                    ),
                                  );
                                  break;
                                case FacebookLoginStatus.error:
                                  showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Column(
                                        children: [
                                          Text(
                                            'Network Error!',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7.0))),
                                            minWidth: 90,
                                            height: 40,
                                            color: Color(kBackgroundColor),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            elevation: 10,
                                            child: Text(
                                              'Try Again',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                      elevation: 10,
                                    ),
                                  );
                                  break;
                              }
                            },
                            child: Image.asset(
                              'assets/images/facebook-logo.png',
                              width: 40,
                            ),
                          ),
                          Image.asset(
                            'assets/images/twitter-logo.png',
                            width: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, SignUpScreen.id);
                          },
                          child: Text(
                            'Register now ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
