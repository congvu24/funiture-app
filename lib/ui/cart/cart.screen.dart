import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  top: MediaQuery.of(context).padding.top + 10),
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).maybePop();
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .canvasColor
                                            .withOpacity(0.5))),
                                child: Icon(Icons.chevron_left),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Icon(Icons.notifications_none_rounded),
                              ),
                            )
                          ],
                        ),
                        ListviewCart()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0, -1),
                        blurRadius: 10)
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tạm tính:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "200.000VND",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        callback: () {
                          Navigator.of(context).pushNamed(Routes.payment);
                        },
                        text: "Đặt hàng")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
