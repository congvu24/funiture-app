import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_address.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/listview_payment.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Đơn vị vận chuyển'),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Giao hàng tiết kiệm",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Text(
                                      "30k",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).canvasColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Giao hàng nhanh",
                                      style: TextStyle(
                                          color: Theme.of(context).canvasColor),
                                    ),
                                    Text(
                                      "15k",
                                      style: TextStyle(
                                          color: Theme.of(context).canvasColor),
                                    )
                                  ],
                                ),
                              ),
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
                    child: Container(
                      child: Column(
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
                                      "Địa chỉ giao hàng",
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
                          ListviewAddress(),
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
                height: 180,
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
                    InkWell(
                      onTap: () {
                        showBottomModal(context);
                      },
                      child: DottedBorder(
                        padding: EdgeInsets.all(10),
                        color: Theme.of(context).canvasColor,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Đối tác giao hàng:",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).canvasColor),
                              ),
                              Text(
                                "GHTK",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).canvasColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        callback: () {
                          Navigator.of(context).pushNamed(Routes.confirm);
                        },
                        text: "Tiếp tục")
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
