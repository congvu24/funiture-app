import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/ui/cart/address.screen.dart';
import 'package:boilerplate/ui/cart/cart.screen.dart';
import 'package:boilerplate/ui/cart/confirm.screen.dart';
import 'package:boilerplate/ui/cart/edit_address.screen.dart';
import 'package:boilerplate/ui/cart/item.screen.dart';
import 'package:boilerplate/ui/cart/payment.screen.dart';
import 'package:boilerplate/ui/cart/success.screen.dart';
import 'package:boilerplate/ui/chat/chat.screen.dart';
import 'package:boilerplate/ui/home/home.page.dart';
import 'package:boilerplate/ui/profile/profile.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/post/post_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;

  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: 60,
      backgroundColor:
          Theme.of(context).primaryColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),

        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: false,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      Home(),
      CartScreen(),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.black,
      ),
      Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            Routes.cart: (context) => CartScreen(),
            Routes.payment: (context) => PaymentScreen(),
            Routes.address: (context) => AddressScreen(),
            Routes.confirm: (context) => ConfirmScreen(),
            Routes.success: (context) => SuccessScreen(),
            Routes.item: (context) => ItemScreen(),
            Routes.editAddress: (context) => EditAddressScreen(),
            // '/second': (context) => MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications_none_rounded),
        title: ("Notification"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bookmark_outline),
        title: ("Wishlist"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline_rounded),
        title: ("Account"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/chat': (context) => ChatScreen(),
          },
        ),
      ),
    ];
  }
}
