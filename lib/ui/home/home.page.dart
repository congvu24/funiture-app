import 'package:boilerplate/ui/cart/item.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_ads.widget.dart';
import 'package:boilerplate/widgets/listview_room.widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyScaffold(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore\nModern furniture",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                InkWell(
                  child: Icon(Icons.search, color: Color(0xff200E32), size: 30),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.cart);
                  },
                  child: Icon(Icons.shopping_cart_outlined,
                      color: Color(0xff200E32), size: 30),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ListAdsView(),
        SizedBox(
          height: 30,
        ),
        ListviewRoom(),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: Icon(Icons.filter_alt_rounded,
                  color: Theme.of(context).canvasColor),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: Routes.item),
                      screen: ItemScreen(),
                      withNavBar: false,
                    );
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color:
                              Theme.of(context).canvasColor.withOpacity(0.5)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Image.asset("assets/images/product-1.png"),
                        ),
                        Expanded(
                          child: Container(
                            // alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Nina Soft Chair",
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '\$40.50',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor),
                                    )
                                  ],
                                ),
                                // InkWell(
                                //   child: Container(
                                //     padding: EdgeInsets.all(5),
                                //     decoration: BoxDecoration(
                                //         borderRadius:
                                //             BorderRadius.all(Radius.circular(7)),
                                //         color: Theme.of(context).primaryColor),
                                //     child: Icon(
                                //       Icons.shopping_cart,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Theme.of(context).canvasColor),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: Theme.of(context).canvasColor.withOpacity(0.5)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Image.asset("assets/images/product-1.png"),
                      ),
                      Expanded(
                        child: Container(
                          // alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Nina Soft Chair",
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '\$40.50',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor),
                                  )
                                ],
                              ),
                              // InkWell(
                              //   child: Container(
                              //     padding: EdgeInsets.all(5),
                              //     decoration: BoxDecoration(
                              //         borderRadius:
                              //             BorderRadius.all(Radius.circular(7)),
                              //         color: Theme.of(context).primaryColor),
                              //     child: Icon(
                              //       Icons.shopping_cart,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Theme.of(context).canvasColor),
                  ),
                )),
              ],
            )
          ],
        )
      ],
    );
  }
}
