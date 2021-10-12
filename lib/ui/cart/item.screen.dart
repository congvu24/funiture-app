import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
                top: MediaQuery.of(context).padding.top + 10),
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      "assets/images/3d-scroll.png",
                                      fit: BoxFit.contain,
                                      width: 300,
                                    )),
                              ),
                              Container(
                                height: 250,
                                width: double.infinity,
                                child: Image.asset(
                                  "assets/images/product-1.png",
                                  // fit: BoxFit.contain,
                                  height: 100,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.pink,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nina Soft Chair ",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("400.000 VND",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "The fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.6)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildSectionItem(context, "Thương hiệu:", "Việt Tiệp"),
                        buildSectionItem(context, "Xuất xứ:", "Việt Nam"),
                        buildSectionItem(context, "Nguyên liệu:", "Gỗ"),
                        buildSectionItem(context, "Kích thước:", null),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Dài:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.8))),
                                  Text("2.0m",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.4)))
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Rộng:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.8))),
                                  Text("2.0m",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.4)))
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sâu:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.8))),
                                  Text("2.0m",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.4)))
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        MyButton(callback: () {}, text: "Thêm vào giỏ hàng")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildSectionItem(
      BuildContext context, String textLeft, String? textRight) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          if (textRight != null)
            Text(
              textRight,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).canvasColor.withOpacity(1)),
            )
        ],
      ),
    );
  }
}
