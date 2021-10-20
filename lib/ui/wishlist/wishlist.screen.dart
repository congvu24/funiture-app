import 'package:boilerplate/ui/cart/tracking.screen.dart';
import 'package:boilerplate/ui/chat/chat.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_wishlist.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyScaffold(
      children: [
        Center(
          child: Text(
            "Theo dõi",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor),
          ),
        ),
        ListWishlist()
      ],
    );
  }
}
