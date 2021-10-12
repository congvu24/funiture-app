import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ConfirmScreen extends StatelessWidget {
  ConfirmScreen({Key? key}) : super(key: key);

  void showBottomModal(context) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 300,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Container(
                      // width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Mã giảm giá:'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 250,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Nhập mã giảm giá",
                                      hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .canvasColor
                                              .withOpacity(0.5)),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .canvasColor
                                                .withOpacity(0.5),
                                            width: 0.0),
                                      )),
                                ),
                              ),
                              Container(
                                // width: 150,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Áp dụng",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Mã của tôi:'),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              DottedBorder(
                                  color: Theme.of(context)
                                      .canvasColor
                                      .withOpacity(0.8),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "DAAKKSS",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .canvasColor
                                                .withOpacity(0.8)),
                                      ),
                                      Text(
                                        "-10%",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .canvasColor
                                                .withOpacity(0.8)),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              DottedBorder(
                                  color: Theme.of(context)
                                      .canvasColor
                                      .withOpacity(0.8),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "SALE1010",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .canvasColor
                                                .withOpacity(0.8)),
                                      ),
                                      Text(
                                        "-15%",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .canvasColor
                                                .withOpacity(0.8)),
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

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
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Xác nhận",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                              alignment: Alignment.center,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    color: Theme.of(context).primaryColor),
                                child: Icon(
                                  Icons.shopping_cart_rounded,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          buildSectionTitle("Sản phẩm:"),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              buildSectionItem("Bàn gỗ x1", "200.000 VND"),
                              buildSectionItem("Bàn gỗ x1", "200.000 VND"),
                              buildSectionItem("Bàn gỗ x1", "200.000 VND")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildSectionTitle("Thanh toán:"),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              buildSectionItem("Ví MoMo", "0192XXX12"),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildSectionTitle("Địa chỉ:"),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Dương Công Vũ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "091293123",
                                    style: TextStyle(
                                        color: Theme.of(context).canvasColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Text(
                                "29 Hoàng Hoa Thám, Xuân Lộc, Đồng Nai",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildSectionTitle("Vận chuyển:"),
                          SizedBox(
                            height: 10,
                          ),
                          buildSectionItem("Giao hàng tiết kiệm", null),
                          SizedBox(
                            height: 20,
                          ),
                          buildSectionTitle("Mã giảm giá:"),
                          SizedBox(
                            height: 10,
                          ),
                          buildSectionItem("GIAMGIANGAY", "-100.000 VND"),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              showBottomModal(context);
                            },
                            child: DottedBorder(
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                              strokeWidth: 1,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Thêm mã giảm giá",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .canvasColor
                                                  .withOpacity(0.5)),
                                        ),
                                      ])),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
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
                          "Thành tiền",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "1.000.000 VND",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        callback: () {
                          Navigator.of(context).pushNamed(Routes.success);
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

  Widget buildSectionItem(String textLeft, String? textRight) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          if (textRight != null)
            Text(
              textRight,
              style: TextStyle(
                fontSize: 16,
              ),
            )
        ],
      ),
    );
  }

  Text buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
