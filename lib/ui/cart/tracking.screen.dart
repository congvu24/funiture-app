import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg-tracking.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
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
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .canvasColor
                                          .withOpacity(0.5))),
                              child: Icon(Icons.chevron_left),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .canvasColor
                                      .withOpacity(0.5),
                                  offset: Offset(0, 3),
                                  blurRadius: 4)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Đơn hàng #11243",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                            Text(
                              "Ngày đặt hàng: 20/10/2021",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .canvasColor
                                      .withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 3,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 3,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 3,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 3,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Thanh toán thành công",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Ví MoMo 1.200.000 VND",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 26),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Đóng gói thành công",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "Đơn đã được đóng gói",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 26),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Đơn hàng được vận chuyển",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "Đơn hàng của bạn sẽ được vận chuyển",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 26),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Giao hàng thành công",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "Đơn hàng sẽ được giao tới bạn",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 26),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Đơn hàng hoàn thành",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "Khách hàng xác nhận đơn hàng hoàn thành",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .canvasColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Text(
                                                    "Xác nhận",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .canvasColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).canvasColor.withOpacity(0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yêu thích dịch vụ của chúng tôi?",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 300,
                              child: MyButton(
                                text: "Đánh giá dịch vụ",
                                callback: () {},
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Cần hỗ trợ?",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      "Liên hệ",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      "FAQ",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
