import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/add-product-screen.dart';
import 'package:smart_dressing_user_app/screens/change-personal-details-screen.dart';
import 'package:smart_dressing_user_app/screens/forgot-password-screen.dart';
import 'package:smart_dressing_user_app/screens/home-screen.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/my-splash-screen.dart';
import 'package:smart_dressing_user_app/screens/order-summary-screen.dart';
import 'package:smart_dressing_user_app/screens/product-detail-screen.dart';
import 'package:smart_dressing_user_app/screens/stitched-products-screen.dart';
import 'package:smart_dressing_user_app/screens/profile-screen.dart';
import 'package:smart_dressing_user_app/screens/settings-screen.dart';
import 'package:smart_dressing_user_app/screens/shopping-cart-screen.dart';
import 'package:smart_dressing_user_app/screens/sign-up-screen.dart';
import 'package:smart_dressing_user_app/screens/un-stitched-products-screen.dart';
import 'package:smart_dressing_user_app/screens/vendor-home-screen.dart';
import 'package:smart_dressing_user_app/screens/virtually-try-on-screen.dart';
import 'package:smart_dressing_user_app/screens/wish-list-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MySplashScreen.id,
      routes: {
        MySplashScreen.id: (context) => SafeArea(child: MySplashScreen()),
        HomeScreen.id: (context) => SafeArea(child: HomeScreen()),
        LogInScreen.id: (context) => SafeArea(child: LogInScreen()),
        SignUpScreen.id: (context) => SafeArea(child: SignUpScreen()),
        ForgotPassword.id: (context) => SafeArea(child: ForgotPassword()),
        ShoppingCart.id: (context) => SafeArea(child: ShoppingCart()),
        WishList.id: (context) => SafeArea(child: WishList()),
        SettingsScreen.id: (context) => SafeArea(child: SettingsScreen()),
        ProfileScreen.id: (context) => SafeArea(child: ProfileScreen()),
        StitchedProductsScreen.id: (context) =>
            SafeArea(child: StitchedProductsScreen()),
        ChangePersonalDetails.id: (context) =>
            SafeArea(child: ChangePersonalDetails()),
        VendorHomeScreen.id: (context) => SafeArea(child: VendorHomeScreen()),
        AddProduct.id: (context) => SafeArea(child: AddProduct()),
        ProductDetailScreen.id: (context) =>
            SafeArea(child: ProductDetailScreen()),
        OrderSummaryScreen.id: (context) =>
            SafeArea(child: OrderSummaryScreen()),
        UnStitchedProductsScreen.id: (context) =>
            SafeArea(child: UnStitchedProductsScreen()),
        VirtuallyTryOnScreen.id: (context) =>
            SafeArea(child: VirtuallyTryOnScreen()),
      },
    );
  }
}
