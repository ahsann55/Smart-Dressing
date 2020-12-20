import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/forgot-password-screen.dart';
import 'package:smart_dressing_user_app/screens/home-screen.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/screens/my-splash-screen.dart';
import 'package:smart_dressing_user_app/screens/settings-screen.dart';
import 'package:smart_dressing_user_app/screens/shopping-cart-screen.dart';
import 'package:smart_dressing_user_app/screens/sign-up-screen.dart';
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
        // ReceiptScreen.id: (context) => SafeArea(child: ReceiptScreen()),
        // BlockExplorerScreen.id: (context) =>
        //     SafeArea(child: BlockExplorerScreen()),
        // RewardsScreen.id: (context) => SafeArea(child: RewardsScreen()),
        // SendConfirmationScreen.id: (context) =>
        //     SafeArea(child: SendConfirmationScreen()),
        // CustomizationScreen.id: (context) =>
        //     SafeArea(child: CustomizationScreen()),
        // MiningScreen.id: (context) => SafeArea(child: MiningScreen()),
      },
    );
  }
}
