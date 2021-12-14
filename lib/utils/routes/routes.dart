import 'package:boilerplate/ui/cart/address.screen.dart';
import 'package:boilerplate/ui/cart/cart.screen.dart';
import 'package:boilerplate/ui/cart/confirm.screen.dart';
import 'package:boilerplate/ui/cart/edit_address.screen.dart';
import 'package:boilerplate/ui/cart/payment.screen.dart';
import 'package:boilerplate/ui/cart/success.screen.dart';
import 'package:boilerplate/ui/cart/tracking.screen.dart';
import 'package:boilerplate/ui/chat/chat.screen.dart';
import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/login/signup.dart';
import 'package:boilerplate/ui/service/design.screen.dart';
import 'package:boilerplate/ui/service/manufactory.screen.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:boilerplate/ui/wishlist/wishlist.screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String signup = '/signup';
  static const String cart = '/cart';
  static const String payment = '/payment';
  static const String address = '/address';
  static const String confirm = '/confirm';
  static const String success = '/success';
  static const String item = '/item';
  static const String chat = '/chat';
  static const String tracking = '/tracking';
  static const String editAddress = '/editAddress';
  static const String wishlist = '/wishlist';
  static const String design = "/design";
  static const String manufactory = "/manufactory";
  static const String ar = "/ar";

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    signup: (BuildContext context) => SignupScreen(),
    cart: (BuildContext context) => CartScreen(),
    payment: (BuildContext context) => PaymentScreen(),
    address: (BuildContext context) => AddressScreen(),
    confirm: (BuildContext context) => ConfirmScreen(),
    success: (BuildContext context) => SuccessScreen(),
    chat: (BuildContext context) => ChatScreen(),
    tracking: (BuildContext context) => TrackingScreen(),
    editAddress: (BuildContext context) => EditAddressScreen(),
    wishlist: (BuildContext context) => Wishlist(),
    design: (BuildContext context) => DesignScreen(),
    manufactory: (BuildContext context) => ManufactoryScreen(),
  };
}
